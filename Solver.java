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




    /**
     *
     */
    public void solve(){
        Query causalDependenciesPred = new Query(
                "consult",
                new Term[] {new Atom("RGPD/causal_dependencies.pl")}
        );
        System.out.println( "opening causal dependencies definition file : " + (causalDependenciesPred.hasSolution() ? "success" : "fail"));

        // TODO à compléter quand j'aurais l'implémentation de ce que renvoie le traducteur

        for (String s : buildTimePredicates()){
            Term pred = Term.textToTerm("assertz(" + s + ")");
            Query q = new Query(pred);
            q.hasSolution();
        }
        Query provenanceGraphPred = new Query(
                "consult",
                new Term[] {new Atom(provenanceGraphPath)}
        );
        System.out.println( "opening provenance graph file : " + (provenanceGraphPred.hasSolution() ? "success" : "fail"));

        for (String s : queries){
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
