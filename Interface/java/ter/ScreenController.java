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
        AtomicReference<String> data = new AtomicReference<>();
        AtomicReference<String> user = new AtomicReference<>();
        AtomicReference<String> process = new AtomicReference<>();


        Label principlesLabel = new Label("Sélectionner les principes à vérfiier :");

        // Les checkbox
        CheckBox principle1 = new CheckBox("Principe 1: Lawfullness");
        CheckBox principle2 = new CheckBox("Principe 2: Right to erase");
        CheckBox principle3 = new CheckBox("Principe 3: Right to access");
        CheckBox principle4 = new CheckBox("Principe 4: Storage limitation");

        choiceScreen.getChildren().addAll(principlesLabel,principle1,principle2,principle3,principle4);

        Label datasLabel = new Label("Sélectionner la donnée à vérifier :");
        choiceScreen.getChildren().addLast(datasLabel);
        ToggleGroup datasGroup = new ToggleGroup();
        List<String> datas = parser.parserData();
        if(datas.isEmpty()){
            choiceScreen.getChildren().addLast(new Text("Aucune donnée disponible"));
        }
        else {
            for (String d : datas) {
                RadioButton dataBtn = new RadioButton(d);
                dataBtn.setToggleGroup(datasGroup);
                dataBtn.setOnAction(e -> {
                        data.set(dataBtn.getText());
                });
                choiceScreen.getChildren().addLast(dataBtn);
            }
        }

        Label usersLabel = new Label("Sélectionner l'utilisateur à vérifier :");
        choiceScreen.getChildren().addLast(usersLabel);
        ToggleGroup usersGroup = new ToggleGroup();
        List<String> users = parser.parserUser();
        if(users.isEmpty()){
            choiceScreen.getChildren().addLast(new Text("Aucun utilisateur disponible"));
        }
        else {
            for (String u : users) {
                RadioButton userBtn = new RadioButton(u);
                userBtn.setToggleGroup(usersGroup);
                userBtn.setOnAction(e -> {
                    user.set(userBtn.getText());
                });
                choiceScreen.getChildren().addLast(userBtn);

            }
        }

        Label processLabel = new Label("Sélectionner le processus à vérifier :");
        choiceScreen.getChildren().addLast(processLabel);
        ToggleGroup processGroup = new ToggleGroup();
        List<String> processes = parser.parserProcess();
        if(processes.isEmpty()){
            choiceScreen.getChildren().addLast(new Text("Aucun processus disponible"));
        }
        else {
            for (String p : processes) {
                RadioButton processBtn = new RadioButton(p);
                processBtn.setToggleGroup(processGroup);
                processBtn.setOnAction(e -> {
                    process.set(processBtn.getText());
                });
                choiceScreen.getChildren().addLast(processBtn);
            }
        }

        Button submitButton = new Button(" Vérifier les principes ");
        submitButton.setOnAction(e -> {

            if (principle1.isSelected()) selectedPrinciples.add("Lawfullness");
            if (principle2.isSelected()) selectedPrinciples.add("Right-to-erasure");
            if (principle3.isSelected()) selectedPrinciples.add("Right-to-access");
            if (principle4.isSelected()) selectedPrinciples.add("Storage-limitation");

            Converter converter = new Converter(selectedPrinciples,graphPath,data.get(),user.get(),process.get());
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