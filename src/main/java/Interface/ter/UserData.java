package Interface.ter;

import java.util.List;

public class UserData {
    private String filePath;
    private List<String> selectedPrinciples;

    // Constructeur
    public UserData(String filePath, List<String> selectedPrinciples) {
        this.filePath = filePath;
        this.selectedPrinciples = selectedPrinciples;
    }

    // Getters
    public String getFilePath() {
        return filePath;
    }

    public List<String> getSelectedPrinciples() {
        return selectedPrinciples;
    }

    @Override
    public String toString() {
        return "Requête Utilisateur : \n" +
                "Chemin (" + filePath + ")\n" +
                "Principe sélectionnés : " + selectedPrinciples ;
    }
}