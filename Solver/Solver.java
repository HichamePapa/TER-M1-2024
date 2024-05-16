package Solver;

import Traducteur.Parser;
import org.jpl7.*;
import org.jpl7.Integer;

import java.io.File;
import java.io.IOException;
import java.util.*;

public class Solver {
    private String provenanceGraphPath;
    private List<String> queries;
    private int tCurrent;
    private int tLimitAccess;
    private int tLimitErase;
    private int tLimitStorage;
    private List<String> personalData; // List of every personal data found in the provenance graph. Given by Parser
    private List<String> users; // List of every user found in the provenance graph. Given by Parser
    private List<String> process; // List of every process found in the provenance graph. Given by Parser

    final Set<String> filesLoad = new HashSet<>();
    final Set<String> predicatesLoad = new HashSet<>();

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
    public Solver(String provenanceGraphPath, List<String> queries, int tCurrent, int tLimitAccess, int tLimitErase, int tLimitStorage) throws IOException {
        setProvenanceGraphPath(provenanceGraphPath);
        this.queries = queries;
        this.tCurrent = tCurrent;
        this.tLimitAccess = tLimitAccess;
        this.tLimitErase = tLimitErase;
        this.tLimitStorage = tLimitStorage;
    }

    /**
     * Update the current provenance graph path. The method also retrieves personal data, users and process of the system
     * @param provenanceGraphPath Path to the Prolog file representing the provenance graph
     * @throws IOException If an error occurs when opening the file
     */
    public void setProvenanceGraphPath(String provenanceGraphPath) throws IOException {
        this.provenanceGraphPath = provenanceGraphPath;
        Parser parser = new Parser(new File(provenanceGraphPath));
        this.personalData = parser.parserData();
        this.users = parser.parserUser();
        this.process = parser.parserProcess();
    }

    public void setQueries(List<String> queries){
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

    // ------------------------------ PROLOG UTILS ------------------------------ //

    /**
     * Loads a list of terms to the Prolog solver
     * @param terms String List containing the terms to load
     */
    void loadTermsFromList(List<Term> terms){
        for (Term t : terms){
            Term assertTerm = Term.textToTerm("assertz(" + t.toString() + ")");
            Query q = new Query(assertTerm);
            q.hasSolution();
            predicatesLoad.add(t.name() + "/" + t.arity());
        }
    }

    /**
     * Unloads all previously load predicates from the Prolog solver. It prevents errors for next solver calls.
     */
    private void unloadAllPredicates(){
        for (String predicate : predicatesLoad){
            Term pred = Term.textToTerm("abolish(" + predicate + ")");
            Query q = new Query(pred);
            q.hasSolution();
        }
        predicatesLoad.clear();
    }

    /**
     * Loads content from a file into the Prolog solver
     * @param path Path to the file to load
     * @throws IOException If an error occurs when opening the file
     */
    private void loadPrologFile(String path) throws IOException{
        Query pred = new Query(
                "consult",
                new Term[] {new Atom(path)}
        );
        if (!pred.hasSolution()){
            throw new IOException("error opening " + path);
        }
        else{
            filesLoad.add(path);
        }
    }

    /**
     * Unloads all previously load files from the Prolog solver. It prevents errors for next solver calls.
     * @throws RuntimeException If an error occurs when closing a file
     */
    private void unloadAllFiles() throws RuntimeException {
        for (String path : filesLoad){
            Query pred = new Query(
                    "unload_file",
                    new Term[] {new Atom(path)}
            );
            if (!pred.hasSolution()){
                throw new RuntimeException("error closing " + path);
            }
        }
        filesLoad.clear();
    }

    /**
     * Prepares the solver for the next verification.
     */
    void resetSolver(){
        unloadAllPredicates();
        unloadAllFiles();
    }

    // ------------------------------ RGPD UTILS ------------------------------ //

    /**
     * Builds a list containing Prolog facts required to check current time and time limits.
     * @return List of terms associating time variables with their values
     */
    private List<Term> buildTimeTerms(){
        List<Term> terms = new ArrayList<>();
        terms.add(new Compound("tCurrent", new Term[]{new Integer(tCurrent)}));
        terms.add(new Compound("tLimit", new Term[]{new Atom("access"), new Integer(tLimitAccess)}));
        terms.add(new Compound("tLimit", new Term[]{new Atom("erase"), new Integer(tLimitErase)}));
        terms.add(new Compound("tLimit", new Term[]{new Atom("storage"), new Integer(tLimitStorage)}));
        return terms;
    }

    /**
     * Builds a list containing terms required to sort personal data. Those associate each user with a list of their personal data, based on the way data is named.
     * @return Terms associating each user with their data
     */
    /*private List<Term> buildPersonalDataTerms(){
        Map<String, List<String>> usersData = new HashMap<>();
        List<Term> terms = new ArrayList<>();
        for (String user : users){
            usersData.put(user.toLowerCase(), new ArrayList<>());
        }
        for (String data : personalData){
            String potentialUserName = data.substring(data.lastIndexOf("_") + 1).toLowerCase();
            if (usersData.containsKey(potentialUserName)){
                usersData.get(potentialUserName).add(data);
            }
        }
        for (String user : users){
            List<String> userData = usersData.get(user.toLowerCase());
            Term t = new Compound("personal", new Term[]{
                    new Atom(user),
                    Term.stringArrayToList(userData.toArray(new String[0]))
            });
            terms.add(t);
        }
        return terms;
    }*/

    /**
     * Loads all time terms to the Prolog solver
     */
    private void loadTimeTerms(){
        loadTermsFromList(buildTimeTerms());
    }

    /**
     * Loads all personal data terms to the Prolog solver, based on the provenance graph
     */
    /*private void loadPersonalDataTerms(){
        if (!personalData.isEmpty()) {
            loadTermsFromList(buildPersonalDataTerms());
        }
    }*/

    // ------------------------------ SOLVER ------------------------------ //

    /**
     * Verifies given queries and outputs observations in console.
     */
    public void solve() throws IOException {
        loadPrologFile("RGPD/causal_dependencies.pl");
        loadTimeTerms();
        loadPrologFile(provenanceGraphPath);

        for (String s : queries){
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

        resetSolver();
    }

    public static void main(String[] args) throws IOException {
        List<String> queries = List.of("legal(P,D,C,TG,T)","eraseCompliant(D)","storageLimitation(D)","rightAccess(S)");

        System.out.println("cas du graphe fourni dans le sujet :");
        Solver s1 = new Solver("Solver/testfiles/SN_prov_graph.pl",queries, 61983,43200,57600,2628000);
        s1.solve();



        System.out.println("\ncas d'un graphe modifié avec plus de problèmes :");
        Solver s2 = new Solver("Solver/testfiles/SN_prov_graph_pb.pl",queries, 61983,43200,57600,30000);
        s2.solve();
    }
}
