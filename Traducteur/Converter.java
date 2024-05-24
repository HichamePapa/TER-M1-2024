package Traducteur;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.jpl7.*;

public class Converter {
    //    private String article ;
    private List<String> principes;
    private String cheminGraphe;
    private List<String> datas;
    private List<String> dataSubjects;
    private List<String> processes;

    public Converter( List<String> listPrincipes, String cheminGraphe, List<String> donnees, List<String> utilisateurs, List<String> processus){
        this.principes = listPrincipes;
        this.cheminGraphe = cheminGraphe;
        if (processus != null && !processus.isEmpty()){
            this.processes = processus;
        } else
            this.processes = Collections.singletonList("P");
        if (donnees != null && !donnees.isEmpty()){
            this.datas = donnees;
        } else
            this.datas = Collections.singletonList("D");

        if (utilisateurs != null && !utilisateurs.isEmpty()) {
            this.dataSubjects = utilisateurs;
        } else
            this.dataSubjects = Collections.singletonList("S");
    }

    public List<String> ConvertToPrologQuery(){

        List<String> listQueries = new ArrayList<>();

        for (String principe : principes) {

            switch (principe){

                case "Lawfullness" : {
                    for(String process : processes) {
                        for(String data : datas) {
                            StringBuilder query = new StringBuilder();

                            query.append("legal(" + process + ", " + data + ", C, TG, T).");

                            listQueries.add(query.toString());
                        }
                    }

                    break;
                }

                case "Right-to-erasure" : {
                    for(String data : datas) {
                        StringBuilder query = new StringBuilder();

                        query.append("eraseCompliant(" + data + ").");

                        listQueries.add(query.toString());
                    }

                    break;
                }
                case "Storage-limitation" : {
                    for(String data : datas) {
                        StringBuilder query = new StringBuilder();

                        query.append("storageLimitation(" + data + ").");
                        listQueries.add(query.toString());
                    }

                    break;
                }
                case "Right-to-access" : {
                    for(String dataSubject : dataSubjects) {
                        StringBuilder query = new StringBuilder();

                        query.append("rightAccess(" + dataSubject + ").");

                        listQueries.add(query.toString());
                    }

                    break;
                }
//                default: listQueries.;

            }
        }

        return listQueries;
    }

    public String getCheminGraphe(){
        return cheminGraphe;
    }

}