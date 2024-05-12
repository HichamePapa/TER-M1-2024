import org.jpl7.Atom;
import org.jpl7.Query;
import org.jpl7.Term;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Solver {
    private String provenanceGraphPath;
    private String[] queries;
    private int tCurrent;
    private int tLimitAccess;
    private int tLimitErase;
    private int tLimitStorage;
    private Parser parser;
    private List<String> personalData; // List of every personal data found in the provenance graph
    private List<String> users; // List of every user found in the provenance graph
    private List<String> process;
    // personal data à récupérer avec le parser depuis graphe de provenance
    // users à récupérer avec le parser depuis graphe de provenance

    /**
     * Initialises the Solver by setting required variables.
     * @param provenanceGraphPath Path to the Prolog file representing the provenance graph
     * @param queries List of queries to submit
     * @param tCurrent Current time value (at which the verification occurs)
     * @param tLimitAccess Maximum time authorized for the system to send a user's data after their request
     * @param tLimitErase Maximum time authorized for the system to delete a user's data after their request
     * @param tLimitStorage Maximum time authorized for the system to store a data after its last use
     * @throws IOException If provenance graph could not be opened
     */
    public Solver(String provenanceGraphPath, String[] queries, int tCurrent, int tLimitAccess, int tLimitErase, int tLimitStorage) throws IOException {
        setProvenanceGraphPath(provenanceGraphPath);
        this.queries = queries;
        this.tCurrent = tCurrent;
        this.tLimitAccess = tLimitAccess;
        this.tLimitErase = tLimitErase;
        this.tLimitStorage = tLimitStorage;
    }

    public void setProvenanceGraphPath(String provenanceGraphPath) throws IOException {
        this.provenanceGraphPath = provenanceGraphPath;
        this.parser = new Parser(new File(provenanceGraphPath));
        this.personalData = parser.parserData();
        this.users = parser.parserUser();
        this.process = parser.parserProcess();
    }

    public void setQueries(String[] queries){
        this.queries = queries;
    }

    // addQueries


    public void setCurrentTime(int tCurrent) {
        this.tCurrent = tCurrent;
    }

    public void setAccessTimeLimit(int tLimitAccess) {
        this.tLimitAccess = tLimitAccess;
    }

    public void setEraseTimeLimit(int tLimitErase) {
        this.tLimitErase = tLimitErase;
    }

    public void setStorageTimeLimit(int tLimitStorage) {
        this.tLimitStorage = tLimitStorage;
    }

    /**
     * Builds predicates required to sort personal data. Those associate each user with a list of their personal data, based on the way data is named.
     * @return Predicates associating each user with their data
     */
    private List<String> buildPersonalDataPredicates(){
        Map<String, List<String>> usersData = new HashMap<>();
        List<String> predicates = new ArrayList<>();
        for (String user : users){
            usersData.put(user.toLowerCase(), new ArrayList<>());
        }

        for (String data : personalData){
            String potentialUserName = data.substring(data.lastIndexOf("_") + 1).toLowerCase();
            if (usersData.containsKey(potentialUserName)){
                usersData.get(potentialUserName).add(data);
            }
        }
        System.out.println(usersData);
        StringBuilder sb;
        for (String user : users){
            sb = new StringBuilder();
            sb.append("personal('");
            sb.append(user);
            sb.append("',[");
            for (String data : usersData.get(user.toLowerCase())){
                sb.append("'").append(data).append("',");
            }
            if (!usersData.get(user.toLowerCase()).isEmpty()){
                sb.deleteCharAt(sb.length()-1);
            }
            sb.append("]).\n");
            predicates.add(sb.toString());
        }
        return predicates;
    }

    /**
     * Builds time predicates required to check current time and time limits.
     * @return List of predicates associating time variables with their values
     */
    private List<String> buildTimePredicates(){
        List<String> predicates = new ArrayList<>();
        predicates.add("tCurrent(" + tCurrent + ")");
        predicates.add("tLimit('access',"+ tLimitAccess +")");
        predicates.add("tLimit('erase',"+ tLimitErase +")");
        predicates.add("tLimit('storage',"+ tLimitStorage +")");
        return predicates;
    }

    private void loadTimePredicates(){
        List <String> timePredicates = buildTimePredicates();
        for (String s : timePredicates){
            Term pred = Term.textToTerm("assertz(" + s + ")");
            Query q = new Query(pred);
            q.hasSolution();
        }
    }

    public void loadPrologFile(String path) throws IOException{
        Query pred = new Query(
                "consult",
                new Term[] {new Atom(path)}
        );
        if (!pred.hasSolution()){
            throw new IOException("error opening " + path);
        }
    }


    public void solve() throws IOException {
        loadPrologFile("RGPD/causal_dependencies.pl");
        loadTimePredicates();
        loadPrologFile(provenanceGraphPath);

        for (String s : queries){
            // TODO à compléter quand j'aurais l'implémentation de ce que renvoie le traducteur
            // en gros c genre si on a tel requête on ouvre le fichier correspondant
            // + vérifier avant si on a pas un cas particulier (pas de wasGeneratedBy, pas de used etc.) pour écrire dans la sortie et traiter la requête en conséquence
            if (s.startsWith("legal")){
                if (process.isEmpty()){
                    System.out.println("WARNING - could not check " + s + " as there is no use of any personal data (no process in provenance graph)");
                    continue;
                }
                else if (users.isEmpty()){
                    System.out.println("WARNING - could not check " + s + " as there is no use of any personal data (no users in provenance graph)");
                    continue;
                }
                else if (personalData.isEmpty()){
                    System.out.println("WARNING - could not check " + s + " as there is no use of any personal data (no personal data in provenance graph)");
                    continue;
                }
                else{
                    loadPrologFile("RGPD/legal.pl");
                }
            } else if (s.startsWith("rightAccess")){
                if (users.isEmpty()){
                    System.out.println("WARNING - could not check " + s + " as there is no access request (no user in provenance graph)");
                    continue;
                }
                else{
                    loadPrologFile("RGPD/right_access.pl");
                }
            } else if (s.startsWith("eraseCompliant")) {
                if (process.isEmpty()){
                    System.out.println("WARNING - could not check " + s + " as there is no erase request (no process in provenance graph)");
                    continue;
                }
                else{
                    loadPrologFile("RGPD/erase_compliant.pl");
                }
            } else if (s.startsWith("storageLimitation")) {
                if (process.isEmpty()){
                    if (personalData.isEmpty()){
                        System.out.println("WARNING - could not check " + s + " as there is no personal data in provenance graph");
                        continue;
                    } else {
                        loadPrologFile("RGPD/storage_limitation_no_use.pl");
                    }
                } else {
                    loadPrologFile("RGPD/storage_limitation.pl");
                }
            }

            Query q = new Query(s);
            q.allSolutions();
        }
    }

    public static void main(String[] args){
        /*List<String> data = List.of("wall_bob", "friend_list_bob", "phone_bob", "id_bob", "email_bob");
        List<String> users = List.of("Bob", "DC");
        Solver s = new Solver();
        for (String p : buildPersonalDataPredicates(data, users)){
            System.out.print(p);
        }*/
    }
}
