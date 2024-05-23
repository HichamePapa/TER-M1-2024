module Interface.java.ter {
    requires javafx.controls;
    requires javafx.fxml;
    requires jpl;
    requires junit;

    opens Interface.java.ter to javafx.fxml;
    exports Interface.java.ter;
}
