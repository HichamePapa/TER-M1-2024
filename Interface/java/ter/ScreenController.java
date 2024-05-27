package Interface.java.ter;

import Solver.Solver;
import Traducteur.Converter;
import Traducteur.Parser;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

public class ScreenController {
    private HashMap<String, Pane> screenMap = new HashMap<>();
    private File graph;
    private Scene main;

    private SolveController solveController = new SolveController();

    public void init() throws IOException {
        initGraphPathScreen();
        initTimesScreen();
    }
    public void setMainScene(Scene scene){
        main = scene;
    }

    public void initGraphPathScreen(){
        VBox graphPathScreen = new VBox(10);
        graphPathScreen.setPadding(new Insets(20, 20, 20, 20));

        // titre
        Label fileLabel = new Label("Chemin:");

        // chemin dépendance
        TextField filePathField = new TextField();
        filePathField.setPromptText("Entrer le chemin du graphe");

        Button submitGraphPath = new Button("OK");
        submitGraphPath.setOnAction(event -> {

            String path = filePathField.getText();

            File graph = new File(path);
            if(graph.isFile()) {
                this.graph = graph;
                try {
                    initChoiceScreen();
                } catch (IOException e) {
                    filePathField.clear();
                    Text error = new Text("Erreur d'ouvertur de fichier");
                    graphPathScreen.getChildren().addLast(error);
                }
                activate("choiceScreen");
            }
            else {
                filePathField.clear();
                Text error = new Text("Fichier non trouvé");
                graphPathScreen.getChildren().addLast(error);
            }

        });

        graphPathScreen.getChildren().addAll(fileLabel, filePathField,submitGraphPath);
        screenMap.put("graphPathScreen",graphPathScreen);

    }

    public void initChoiceScreen() throws IOException {
        ScrollPane scroll = new ScrollPane();
        VBox choiceScreen = new VBox(10);
        choiceScreen.setPadding(new Insets(20, 20, 20, 20));
        Parser parser = new Parser(graph);

        ArrayList<String> selectedPrinciples = new ArrayList<>();
        String graphPath = graph.getAbsolutePath();


        Label principlesLabel = new Label("Sélectionner les principes à vérfiier :");

        // Les checkbox
        CheckBox principle1 = new CheckBox("Principe 1: Lawfullness");
        CheckBox principle2 = new CheckBox("Principe 2: Right to erase");
        CheckBox principle3 = new CheckBox("Principe 3: Right to access");
        CheckBox principle4 = new CheckBox("Principe 4: Storage limitation");

        choiceScreen.getChildren().addAll(principlesLabel,principle1,principle2,principle3,principle4);

        Label datasLabel = new Label("Sélectionner la donnée à vérifier :");
        choiceScreen.getChildren().addLast(datasLabel);
        List<String> datas = parser.parserData();

        ArrayList<CheckBox> datasBoxes = new ArrayList<>();
        if(datas.isEmpty()){
            choiceScreen.getChildren().addLast(new Text("Aucune donnée disponible"));
        }
        else {
            for (String d : datas) {

                CheckBox dataBtn = new CheckBox(d);
                dataBtn.setMnemonicParsing(false);     //if true the first underscore doesn't show up
                datasBoxes.add(dataBtn);
                choiceScreen.getChildren().addLast(dataBtn);
            }
        }

        Label usersLabel = new Label("Sélectionner l'utilisateur à vérifier :");
        choiceScreen.getChildren().addLast(usersLabel);
        List<String> users = parser.parserUser();
        ArrayList<CheckBox>  usersBoxes = new ArrayList<>();
        if(users.isEmpty()){
            choiceScreen.getChildren().addLast(new Text("Aucun utilisateur disponible"));
        }
        else {
            for (String u : users) {
                CheckBox userBtn = new CheckBox(u);
                userBtn.setMnemonicParsing(false);
                usersBoxes.add(userBtn);
                choiceScreen.getChildren().addLast(userBtn);

            }
        }

        Label processLabel = new Label("Sélectionner le processus à vérifier :");
        choiceScreen.getChildren().addLast(processLabel);
        List<String> processes = parser.parserProcess();
        ArrayList<CheckBox> processesBoxes = new ArrayList<>();
        if(processes.isEmpty()){
            choiceScreen.getChildren().addLast(new Text("Aucun processus disponible"));
        }
        else {
            for (String p : processes) {
                CheckBox processBtn = new CheckBox(p);
                processBtn.setMnemonicParsing(false);
                processesBoxes.add(processBtn);
                choiceScreen.getChildren().addLast(processBtn);
            }
        }

        Button submitButton = new Button(" Vérifier les principes ");
        submitButton.setOnAction(e -> {

            if (principle1.isSelected()) selectedPrinciples.add("Lawfullness");
            if (principle2.isSelected()) selectedPrinciples.add("Right-to-erasure");
            if (principle3.isSelected()) selectedPrinciples.add("Right-to-access");
            if (principle4.isSelected()) selectedPrinciples.add("Storage-limitation");

            ArrayList<String>  selectedDatas = new ArrayList<>();
            ArrayList<String> selectedUsers = new ArrayList<>();
            ArrayList<String> selectedProcesses = new ArrayList<>();

            for(CheckBox d : datasBoxes){
                if(d.isSelected()) selectedDatas.add(d.getText());
            }
            for(CheckBox u : usersBoxes){
                if(u.isSelected()) selectedUsers.add(u.getText());
            }
            for(CheckBox p : processesBoxes){
                if(p.isSelected()) selectedProcesses.add(p.getText());
            }

            Converter converter = new Converter(selectedPrinciples,graphPath,selectedDatas,selectedUsers,selectedProcesses);
            solveController.setConverter(converter);
            activate("timesScreen");
        });

        choiceScreen.getChildren().addLast(submitButton);
        scroll.setContent(choiceScreen);

        VBox choiceScreenScrollable = new VBox(10);
        choiceScreenScrollable.setPadding(new Insets(20, 20, 20, 20));

        choiceScreenScrollable.getChildren().addAll(choiceScreen,scroll);

        screenMap.put("choiceScreen",choiceScreenScrollable);

    }

    public void initTimesScreen(){
        VBox timesScreen = new VBox(10);
        timesScreen.setPadding(new Insets(20, 20, 20, 20));


        Label currentTimeLabel = new Label("Temps de la vérification:");
        TextField currentTimeField = new TextField();

        Label timeLimitAccessLabel = new Label("Délai maximum d'accès:");
        TextField timeAccessField = new TextField();

        Label timeLimitEraseLabel = new Label("Délai maximum de suppression:");
        TextField timeEraseField = new TextField();

        Label timeLimitStorageLabel = new Label("Délai maximum de stockage:");
        TextField timeStorageField = new TextField();


        Button submitTimes = new Button("OK");
        submitTimes.setOnAction(event -> {
            Solver solver = new Solver();
            int value = Integer.parseInt(currentTimeField.getText());
            solver.setCurrentTime(value);
            value = Integer.parseInt(timeAccessField.getText());
            solver.setAccessTimeLimit(value);
            value = Integer.parseInt(timeEraseField.getText());
            solver.setEraseTimeLimit(value);
            value = Integer.parseInt(timeStorageField.getText());
            solver.setStorageTimeLimit(value);

            solveController.setSolver(solver);
            try {
                initResultsScreen();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            activate("resultsScreen");

        });

        timesScreen.getChildren().addAll(currentTimeLabel,currentTimeField, timeLimitAccessLabel,timeAccessField,timeLimitEraseLabel,timeEraseField,timeLimitStorageLabel,timeStorageField,submitTimes);
        screenMap.put("timesScreen",timesScreen);

    }

    public void initResultsScreen() throws IOException {
        VBox resultsScreen = new VBox(10);
        resultsScreen.setPadding(new Insets(20, 20, 20, 20));
        Text results = new Text(solveController.solve());
        resultsScreen.getChildren().add(results);

        screenMap.put("resultsScreen",resultsScreen);

    }

    public void activate(String name){
        main.setRoot( screenMap.get(name) );
    }

    public Pane getBasePane(){
        return screenMap.get("graphPathScreen");
    }
}