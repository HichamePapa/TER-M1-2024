package Interface.ter;

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
import java.util.HashMap;
import java.util.List;

public class ScreenController {
    private HashMap<String, Pane> screenMap = new HashMap<>();
    private File graph;
    private File timeFile;
    private Scene main;

    private SolveController solveController = new SolveController();

    public void init() throws IOException {
        initGraphPathScreen();
        initTimesHelpScreen();
    }
    public void setMainScene(Scene scene){
        main = scene;
    }

    public void initGraphPathScreen(){
        graph = null;
        timeFile = null;

        VBox graphPathScreen = new VBox(10);
        graphPathScreen.setPadding(new Insets(20, 20, 20, 20));

        // titre
        Label fileLabel = new Label("Entrer le chemin du fichier du graphe:");

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
                    Text error = new Text("Erreur d'ouverture de fichier");
                    graphPathScreen.getChildren().add(error);
                }
                activate("choiceScreen");
            }
            else {
                graphPathScreen.getChildren().removeIf(s -> {
                    if(s instanceof Text s1) {
                        return s1.getText().equals("Fichier non trouvé");
                    }
                    return false;
                });
                filePathField.clear();
                Text error = new Text("Fichier non trouvé");
                graphPathScreen.getChildren().add(error);
            }

        });

        graphPathScreen.getChildren().addAll(fileLabel, filePathField, submitGraphPath);

        screenMap.put("graphPathScreen",graphPathScreen);

    }

    public void initChoiceScreen() throws IOException {
        ScrollPane scroll = new ScrollPane();
        VBox choiceScreen = new VBox(10);
        choiceScreen.setPadding(new Insets(20, 20, 20, 20));

        Label timeFileLabel = new Label("Entrer le chemin du fichier de données de temps");
        TextField timeFilePathField;
        if(timeFile != null) {
             timeFilePathField = new TextField(timeFile.getPath());
        }
        else{
            timeFilePathField = new TextField();
        }

        timeFilePathField.setPromptText("Chemin du fichier");

        Button redirectToHelp = new Button("Aide");
        redirectToHelp.setOnAction(e -> {
            activate("timesHelpScreen");
        });
        choiceScreen.getChildren().addAll(timeFileLabel, timeFilePathField, redirectToHelp);

        Parser parser = new Parser(graph);

        ArrayList<String> selectedPrinciples = new ArrayList<>();
        String graphPath = graph.getAbsolutePath();

        Label principlesLabel = new Label("Sélectionner les principes à vérifier :");

        // Les checkbox
        CheckBox principle1 = new CheckBox("Principe 1: Lawfullness");
        CheckBox principle2 = new CheckBox("Principe 2: Right to erase");
        CheckBox principle3 = new CheckBox("Principe 3: Right to access");
        CheckBox principle4 = new CheckBox("Principe 4: Storage limitation");

        choiceScreen.getChildren().addAll(principlesLabel,principle1,principle2,principle3,principle4);

        Label datasLabel = new Label("Sélectionner la donnée à vérifier :");
        choiceScreen.getChildren().add(datasLabel);
        List<String> datas = parser.parserData();

        ArrayList<CheckBox> datasBoxes = new ArrayList<>();
        if(datas.isEmpty()){
            choiceScreen.getChildren().add(new Text("Aucune donnée disponible"));
        }
        else {
            for (String d : datas) {

                CheckBox dataBtn = new CheckBox(d);
                dataBtn.setMnemonicParsing(false);     //if true the first underscore doesn't show up
                datasBoxes.add(dataBtn);
                choiceScreen.getChildren().add(dataBtn);
            }
        }

        Label usersLabel = new Label("Sélectionner l'utilisateur à vérifier :");
        choiceScreen.getChildren().add(usersLabel);
        List<String> users = parser.parserUser();
        ArrayList<CheckBox>  usersBoxes = new ArrayList<>();
        if(users.isEmpty()){
            choiceScreen.getChildren().add(new Text("Aucun utilisateur disponible"));
        }
        else {
            for (String u : users) {
                CheckBox userBtn = new CheckBox(u);
                userBtn.setMnemonicParsing(false);
                usersBoxes.add(userBtn);
                choiceScreen.getChildren().add(userBtn);

            }
        }

        Label processLabel = new Label("Sélectionner le processus à vérifier :");
        choiceScreen.getChildren().add(processLabel);
        List<String> processes = parser.parserProcess();
        ArrayList<CheckBox> processesBoxes = new ArrayList<>();
        if(processes.isEmpty()){
            choiceScreen.getChildren().add(new Text("Aucun processus disponible"));
        }
        else {
            for (String p : processes) {
                CheckBox processBtn = new CheckBox(p);
                processBtn.setMnemonicParsing(false);
                processesBoxes.add(processBtn);
                choiceScreen.getChildren().add(processBtn);
            }
        }


        Button submitButton = new Button(" Vérifier les principes ");
        submitButton.setOnAction(e -> {

            Solver solver = new Solver();
            String timePath = timeFilePathField.getText();

            File timeFile = new File(timePath);
            if(timeFile.isFile()) {
                this.timeFile = timeFile;
                try {
                    solver.setTimeFilePath(timeFile.getAbsolutePath());
                } catch (IOException err) {
                    timeFilePathField.clear();
                    Text error = new Text("Erreur d'ouverture du fichier de données de temps");
                    choiceScreen.getChildren().add(error);
                    throw new RuntimeException(String.valueOf(error));
                }
            }
            else {
                timeFilePathField.clear();
                Text error = new Text("Fichier non trouvé");
                choiceScreen.getChildren().add(error);
            }

            if (principle1.isSelected()) selectedPrinciples.add("Lawfullness");
            if (principle2.isSelected()) selectedPrinciples.add("Right-to-erasure");
            if (principle3.isSelected()) selectedPrinciples.add("Right-to-access");
            if (principle4.isSelected()) selectedPrinciples.add("Storage-limitation");
            if (selectedPrinciples.isEmpty()) selectedPrinciples.addAll(List.of("Lawfullness","Right-to-erasure","Right-to-access","Storage-limitation"));

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

            solveController.setSolver(solver);
            try {
                initResultsScreen();
            } catch (IOException err) {
                throw new RuntimeException(err);
            }
            activate("resultsScreen");

        });

        Button returnBtn = new Button("Retour");
        returnBtn.setOnAction(e -> {
            initGraphPathScreen();
            activate("graphPathScreen");
        });

        scroll.setContent(choiceScreen);

        VBox choiceScreenScrollable = new VBox(10);
        choiceScreenScrollable.setPadding(new Insets(20, 20, 20, 20));

        choiceScreenScrollable.getChildren().addAll(choiceScreen,scroll,submitButton,returnBtn);

        screenMap.put("choiceScreen",choiceScreenScrollable);

    }

    public void initTimesHelpScreen(){
        VBox timesHelpScreen = new VBox(10);
        timesHelpScreen.setPadding(new Insets(20, 20, 20, 20));

        Text helpText = new Text("Le fichier de données de temps contient les temps limites et le temps de vérification.\n Ce fichier est au format suivant :");
        Text format = new Text("tCurrent(<Time>).\n" +
                "tLimit('access',<Time>).\n" +
                "tLimit('erase',<Time>).\n" +
                "tLimit('storage',<Time>).");

        Button returnButton = new Button("Retour");
        returnButton.setOnAction(e -> {

            activate("choiceScreen");
        });

        timesHelpScreen.getChildren().addAll(helpText,format,returnButton);
        screenMap.put("timesHelpScreen",timesHelpScreen);

    }

    public void initResultsScreen() throws IOException {
        VBox resultsScreen = new VBox(10);
        resultsScreen.setPadding(new Insets(20, 20, 20, 20));
        Label label = new Label("Résultats:");
        Text results = new Text(solveController.solve());
        resultsScreen.getChildren().addAll(label,results);

       ScrollPane scroll = new ScrollPane();
        scroll.setContent(resultsScreen);

        VBox resultsScreenScrollable = new VBox(10);
        resultsScreenScrollable.setPadding(new Insets(20, 20, 20, 20));

        resultsScreenScrollable.getChildren().addAll(resultsScreen,scroll);

        Button newVerif = new Button("Nouvelle vérification");
        newVerif.setOnAction(e -> {
            try {
                initChoiceScreen();
                activate("choiceScreen");
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        });
        resultsScreenScrollable.getChildren().add(newVerif);


        screenMap.put("resultsScreen",resultsScreenScrollable);

    }

    public void activate(String name){
        main.setRoot( screenMap.get(name) );
    }

    public Pane getBasePane(){
        return screenMap.get("graphPathScreen");
    }
}