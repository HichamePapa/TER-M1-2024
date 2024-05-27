package Interface.ter;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

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



    public static void main(String[] args) {
        launch(args);
    }
}

