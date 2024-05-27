package Interface.java.ter;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * JavaFX App
 */
public class App extends Application {
    ScreenController screenController = new ScreenController();



    @Override
    public void start(Stage primaryStage) throws IOException {
        screenController.init();
        primaryStage.setTitle("Vérification GDPR");
        Scene scene = new Scene(screenController.getBasePane(),800,600);
        screenController.setMainScene(scene);
        primaryStage.setScene(scene);
        primaryStage.show();
    }



    public static void main(String[] args) throws IOException {
        launch(args);
    }
}

