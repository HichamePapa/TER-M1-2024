package Traducteur;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;


public class Parser {
    private File fichier;

    public Parser(File graphe) {
        this.fichier = graphe;
    }

    public List<String> parserData() throws IOException {
        List<String> list = new ArrayList<>();
        String[] dataArray;
        String data;
        FileReader fr = new FileReader(fichier);
        BufferedReader br = new BufferedReader(fr);
        String ligne = br.readLine();
        StringBuilder listBuilder = new StringBuilder();
        char caractere;
        StringBuilder dataBuilder = new StringBuilder();

        if(fichier.length()!= 0) {

            while (ligne != null) {
                if ((ligne.startsWith("wasGeneratedBy")) && ligne.contains("'personal data'")) {
                    int i = 16;
                    while (ligne.charAt(i) != '\'') {
                        caractere = ligne.charAt(i);
                        dataBuilder.append(caractere);
                        i++;
                    }
                    if (dataBuilder.isEmpty()) {
                        throw new NullPointerException();
                    }
                    listBuilder.append(dataBuilder + ",");
                    dataBuilder.setLength(0);
                }

                //Pour boucler
                ligne = br.readLine();

            }
            data = listBuilder.toString();
            dataArray = data.split(",");
            list = Arrays.stream(dataArray).toList();
            list = list.stream().distinct().collect(Collectors.toList());

        }

        return list;
    }

    public List<String> parserUser() throws IOException {
        List<String> list = new ArrayList<>();
        String[] userArray;
        String user;
        FileReader fr = new FileReader(fichier);
        BufferedReader br = new BufferedReader(fr);
        String ligne = br.readLine();
        StringBuilder listBuilder = new StringBuilder();
        StringBuilder userBuilder = new StringBuilder();
        char caractere;

        if(fichier.length()!= 0) {

            while (ligne != null) {
                if (ligne.startsWith("wasControlledBy")) {
                    int i = 17;
                    while (ligne.charAt(i) != ',') {
                        i++;
                    }
                    i += 2;
                    while (ligne.charAt(i) != '\'') {
                        caractere = ligne.charAt(i);
                        userBuilder.append(caractere);
                        i++;

                    }

                    if (userBuilder.isEmpty()) {
                        throw new NullPointerException();
                    }

                    listBuilder.append(userBuilder + ",");
                    userBuilder.setLength(0);
                }

                ligne = br.readLine();

            }
            user = listBuilder.toString();
            userArray = user.split(",");
            list = Arrays.stream(userArray).toList();
            list = list.stream().distinct().collect(Collectors.toList());

        }

        return list;
    }


    public List<String> parserProcess() throws IOException {
        List<String> list = new ArrayList<>();
        String[] processArray;
        String process;
        FileReader fr = new FileReader(fichier);
        BufferedReader br = new BufferedReader(fr);
        String ligne = br.readLine();
        StringBuilder listBuilder = new StringBuilder();
        char caractere;
        StringBuilder processBuilder = new StringBuilder();

        if(fichier.length()!= 0) {

            while (ligne != null) {
                if (ligne.startsWith("action")) {
                    int i = 8;
                    while (ligne.charAt(i) != '\'') {
                        caractere = ligne.charAt(i);
                        processBuilder.append(caractere);
                        i++;
                    }
                    if (processBuilder.isEmpty()) {
                        throw new NullPointerException();
                    }
                    listBuilder.append(processBuilder + ",");
                    processBuilder.setLength(0);
                }

                //Pour boucler
                ligne = br.readLine();

            }
            process = listBuilder.toString();
            processArray = process.split(",");
            list = Arrays.stream(processArray).toList();
            list = list.stream().distinct().collect(Collectors.toList());

        }

        return list;
    }

}
