import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Solver {
    private static String PROVENANCE_GRAPH_PATH;
    private static String[] QUERIES;
    private static String[] PERSONAL_DATA;
    private static int TCURRENT;
    private static int TLIMITACCESS;
    private static int TLIMITERASE;
    private static int TLIMITSTORAGE;
    // personal data à récupérer avec le parser depuis graphe de provenance
    // users à récupérer avec le parser depuis graphe de provenance

    public static void setProvenanceGraphPath(String PROVENANCE_GRAPH_PATH){
        Solver.PROVENANCE_GRAPH_PATH = PROVENANCE_GRAPH_PATH;
        // initialiser personal data, users
    }

    public static void setQueries(String[] QUERIES){
        Solver.QUERIES = QUERIES;
    }

    // addQueries


    public static void setCurrentTime(int TCURRENT) {
        Solver.TCURRENT = TCURRENT;
    }

    public static void setAccessTimeLimit(int TLIMITACCESS) {
        Solver.TLIMITACCESS = TLIMITACCESS;
    }

    public static void setEraseTimeLimit(int TLIMITERASE) {
        Solver.TLIMITERASE = TLIMITERASE;
    }

    public static void setStorageTimeLimit(int TLIMITSTORAGE) {
        Solver.TLIMITSTORAGE = TLIMITSTORAGE;
    }

    /**
     * Builds predicates required to sort personal data. Those associate each user with a list of their personal data, based on the way data is named.
     * @param personalData List of every data found in the provenance graph
     * @param users List of every user found in the provenance graph
     * @return Predicates associating each user with their data
     */
    private static List<String> buildPersonalDataPredicates(List<String> personalData, List<String> users){
        Map<String, List<String>> usersData = new HashMap<>();
        List<String> predicates = new ArrayList<>();
        for (String user : users){
            usersData.put(user.toLowerCase(), new ArrayList<>());
        }
        for (String data : personalData){
            String potentialUserName = data.substring(data.lastIndexOf("_") + 1).toLowerCase();
            if (users.contains(potentialUserName)){
                usersData.get(potentialUserName).add(data);
            }
        }

        StringBuilder sb;
        for (String user : users){
            sb = new StringBuilder();
            sb.append("personal('");
            sb.append(user);
            sb.append("',[");
            for (String data : usersData.get(user.toLowerCase())){
                sb.append("'").append(data).append("',");
            }
            sb.deleteCharAt(sb.length()-1);
            sb.append("]).");
            predicates.add(sb.toString());
        }
        return predicates;
    }

    /**
     * Builds time predicates required to check current time and time limits.
     * @return List of predicates associating time variables with their values
     */
    private static List<String> buildTimePredicates(){
        List<String> predicates = new ArrayList<>();
        predicates.add("tCurrent(" + TCURRENT + ").");
        predicates.add("tLimit('access',"+TLIMITACCESS+").");
        predicates.add("tLimit('erase',"+TLIMITERASE+").");
        predicates.add("tLimit('storage',"+TLIMITSTORAGE+").");
        return predicates;
    }

    /**
     * Initialises the Solver by setting required variables.
     * @param provenanceGraphPath Path to the Prolog file representing the provenance graph
     * @param queries List of queries to submit
     * @param tCurrent Current time value (at which the verification occurs)
     * @param tLimitAccess Maximum time authorized for the system to send a user's data after their request
     * @param tLimitErase Maximum time authorized for the system to delete a user's data after their request
     * @param tLimitStorage Maximum time authorized for the system to store a data after its last use
     */
    public static void init(String provenanceGraphPath, String[] queries, int tCurrent, int tLimitAccess, int tLimitErase, int tLimitStorage){
        setProvenanceGraphPath(provenanceGraphPath);
        setQueries(queries);
        setCurrentTime(tCurrent);
        setAccessTimeLimit(tLimitAccess);
        setEraseTimeLimit(tLimitErase);
        setStorageTimeLimit(tLimitStorage);
    }

    /**
     *
     */
    public static void solve(){

    }
}
