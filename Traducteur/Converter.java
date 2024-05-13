package Traducteur;

import java.util.ArrayList;
import java.util.List;

public class Converter {
//    private String article ;
    private List<String> principes;
    private String cheminGraphe;
    private String data;
    private String dataSubject;

    public Converter( List<String> listPrincipes, String cheminGraphe, String donnee, String utilisateur){
        this.principes = listPrincipes;
        this.cheminGraphe = cheminGraphe;
        if (donnee != null){
            this.data = donnee;
        } else
            this.data = "D";

        if (utilisateur != null) {
            this.dataSubject = utilisateur;
        } else
            this.dataSubject = "S";
    }

    public List<String> ConvertToPrologQuery(){

        List<String> listQueries = new ArrayList<>();

        for (String principe : principes) {

            switch (principe){

                case "Lawfullness" : {
                    StringBuilder query = new StringBuilder();

                    query.append("?− legal(P, " + data + ", C, T G, T).");

                    listQueries.add(query.toString());

                    break;
                }

                case "Right-to-erasure" : {
                    StringBuilder query = new StringBuilder();

                    query.append("?− eraseCompliant("+data+").");

                    listQueries.add(query.toString());

                    break;
                }
                case "Storage-limitation" : {
                    StringBuilder query = new StringBuilder();

                    query.append("?− storageLimitation("+data+").");
                    listQueries.add(query.toString());

                    break;
                }
                case "Right-to-access" : {
                    StringBuilder query = new StringBuilder();

                    query.append("?− rigthAccess("+dataSubject+").");

                    listQueries.add(query.toString());

                    break;
                }
//                default: listQueries.;

            }
        }

        return listQueries;
    }

    public void convertToComprehenText(){
        //
    }

    public String getCheminGraphe(){
        return cheminGraphe;
    }

}
