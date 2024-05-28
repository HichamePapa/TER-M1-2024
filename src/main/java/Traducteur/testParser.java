package Traducteur;

import org.junit.Test;
import static org.junit.Assert.*;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

public class testParser {
    Parser p;
    List<String> listData ;
    List<String> listUser;
    List<String> listProcess;


//tests pour le parseur des donnees
    @Test
    public void testParserDataEmptyFile() throws IOException {
        File fichier = new File("Files/file");
        FileWriter fw = new FileWriter(fichier);
        fw.close();
        p = new Parser(fichier);
        listData = p.parserData();
        assertTrue(listData.isEmpty());
    }

    @Test
    public void testParserDataWithoutWasGeneratedBy() throws IOException{
        File fichier = new File("Files/file1");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("wasControlledBy('create_account','Bob','owner',10,15).\n");
        br.write("used('consent','privacy_policy_template','template',16).\n");
        br.write("action('consent','consent').");
        br.close();
        p = new Parser(fichier);
        listData = p.parserData();
        assertTrue(listData.isEmpty());
    }

    @Test
    public void testParserDataWithoutData() throws IOException{
        File fichier = new File("Files/file2");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("wasGeneratedBy('','create_account','personal data',15).\n");
        br.close();
        p = new Parser(fichier);
        assertThrows(NullPointerException.class, () -> p.parserData());
    }

    @Test
    public void testParserDataWithOneData() throws IOException{
        File fichier = new File("Files/file3");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("wasGeneratedBy('wall_bob','create_account','personal data',15).\n");
        br.close();
        p = new Parser(fichier);
        listData = p.parserData();
        String expected = "wall_bob";
        assertEquals(expected, listData.get(0));
    }
    @Test
    public void testParserDataSeveralData() throws IOException{
        File fichier = new File("Files/file4");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("wasGeneratedBy('wall_bob','create_account','personal data',15).\n");
        br.write("used('consent','privacy_policy_template','template',16).\n");
        br.write("wasGeneratedBy('friend_list_bob','create_account','personal data',15).\n");
        br.write("action('askDataAccess','askDataAccess').\n");
        br.write("wasGeneratedBy('phone_bob','create_account','personal data',15).\n");
        br.close();
        p = new Parser(fichier);
        listData = p.parserData();
        String expected1 = "wall_bob";
        String expected2 = "friend_list_bob";
        String expected3 = "phone_bob";
        assertEquals(expected1, listData.get(0));
        assertEquals(expected2, listData.get(1));
        assertEquals(expected3, listData.get(2));
    }

    @Test
    public void testParserDataNumberData() throws IOException{
        File fichier = new File("Files/file5");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("wasGeneratedBy('wall_bob','create_account','personal data',15).\n");
        br.write("used('consent','privacy_policy_template','template',16).\n");
        br.write("wasGeneratedBy('friend_list_bob','create_account','personal data',15).\n");
        br.write("action('askDataAccess','askDataAccess').\n");
        br.write("wasGeneratedBy('phone_bob','create_account','personal data',15).\n");
        br.close();
        p = new Parser(fichier);
        listData = p.parserData();
        String expected1 = "wall_bob";
        String expected2 = "friend_list_bob";
        String expected3 = "phone_bob";
        int numberExpected = 3;
        assertEquals(expected1, listData.get(0));
        assertEquals(expected2, listData.get(1));
        assertEquals(expected3, listData.get(2));
        assertEquals(numberExpected, listData.stream().count());
        assertThrows(IndexOutOfBoundsException.class, () -> listData.get(3));
    }

    @Test
    public void testParserDataOnlyPersonalData() throws IOException {
        File fichier = new File("Files/file6");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("wasGeneratedBy('wall_bob','create_account','personal data',15).\n");
        br.write("wasGeneratedBy('privacy_policy_template','create_account','policy',15).\n");
        br.write("wasGeneratedBy('phone_bob','create_account','personal data',15).\n");
        br.write("wasGeneratedBy('consent_bob_v0','consent','consent',17).\n");
        br.close();
        p = new Parser(fichier);
        listData = p.parserData();
        String expected1 = "wall_bob";
        String expected2 = "phone_bob";
        int numberExpected = 2;
        assertEquals(expected1, listData.get(0));
        assertEquals(expected2, listData.get(1));
        assertEquals(numberExpected, listData.stream().count());
    }



    //tests pour le parseur utilisateurs
    @Test
    public void testParserUserEmptyFile() throws IOException {
        File fichier = new File("Files/fileUser");
        FileWriter fw = new FileWriter(fichier);
        fw.close();
        p = new Parser(fichier);
        listUser = p.parserUser();
        assertTrue(listUser.isEmpty());
    }

    @Test
    public void testParserUserWithoutWasControlledBy() throws IOException{
        File fichier = new File("Files/fileUser1");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("used('consent','privacy_policy_template','template',16).\n");
        br.write("action('consent','consent').");
        br.close();
        p = new Parser(fichier);
        listUser = p.parserData();
        assertTrue(listUser.isEmpty());
    }

    @Test
    public void testParserUserWithoutUser() throws IOException{
        File fichier = new File("Files/fileUser2");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("wasControlledBy('create_account','','owner',10,15).\n");
        br.close();
        p = new Parser(fichier);
        assertThrows(NullPointerException.class, () -> p.parserUser());
    }

    @Test
    public void testParserUserWithOneUser() throws IOException{
        File fichier = new File("Files/fileUser3");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("wasControlledBy('create_account','Bob','owner',10,15).\n");
        br.close();
        p = new Parser(fichier);
        listUser = p.parserUser();
        String expected = "Bob";
        assertEquals(expected, listUser.get(0));
    }
    @Test
    public void testParserUserSeveralUser() throws IOException{
        File fichier = new File("Files/fileUser4");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("wasControlledBy('create_account','Bob','owner',10,15).\n");
        br.write("used('consent','privacy_policy_template','template',16).\n");
        br.write("wasControlledBy('consent','Alice','owner',16,20).\n");
        br.write("action('askDataAccess','askDataAccess').\n");
        br.write("wasControlledBy('sendData','DC','owner', 44700, 44703).\n");
        br.close();
        p = new Parser(fichier);
        listUser = p.parserUser();
        String expected1 = "Bob";
        String expected2 = "Alice";
        String expected3 = "DC";
        assertEquals(expected1, listUser.get(0));
        assertEquals(expected2, listUser.get(1));
        assertEquals(expected3, listUser.get(2));
    }

    @Test
    public void testParserUserNumberUser() throws IOException{
        //permet aussi de verifier que la methode gere la redondance des utilisateur

        File fichier = new File("Files/fileUser5");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("wasControlledBy('create_account','Bob','owner',10,15).\n");
        br.write("used('consent','privacy_policy_template','template',16).\n");
        //juste en-dessous nous avons l'utilisateur Bob pour une 2eme fois
        br.write("wasControlledBy('consent','Bob','owner',16,20).\n");
        br.write("action('askDataAccess','askDataAccess').\n");
        br.write("wasControlledBy('sendData','DC','owner', 44700, 44703).\n");
        br.close();
        p = new Parser(fichier);
        listUser = p.parserUser();
        String expected1 = "Bob";
        String expected2 = "DC";
        int numberExpected = 2;
        //la preuve que la redondance est egalement geree
        assertEquals(expected1, listUser.get(0));
        assertEquals(expected2, listUser.get(1));
        assertEquals(numberExpected, listUser.stream().count());
        assertThrows(IndexOutOfBoundsException.class, () -> listUser.get(2));
    }


    //tests pour le parseur des precessus
    @Test
    public void testParserProcessEmptyFile() throws IOException {
        File fichier = new File("Files/fileProcess");
        FileWriter fw = new FileWriter(fichier);
        fw.close();
        p = new Parser(fichier);
        listProcess = p.parserProcess();
        assertTrue(listProcess.isEmpty());
    }

    @Test
    public void testParserProcessWithoutAction() throws IOException{
        File fichier = new File("Files/fileProcess1");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("used('consent','privacy_policy_template','template',16).\n");
        br.write("wasTriggeredBy('createCookie','joinGroup','information',21).\n");
        br.close();
        p = new Parser(fichier);
        listProcess = p.parserData();
        assertTrue(listProcess.isEmpty());
    }

    @Test
    public void testParserProcessWithoutProcess() throws IOException{
        File fichier = new File("Files/fileProcess2");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("action('','consent').\n");
        br.close();
        p = new Parser(fichier);
        assertThrows(NullPointerException.class, () -> p.parserProcess());
    }

    @Test
    public void testParserProcessWithOneProcess() throws IOException{
        File fichier = new File("Files/fileProcess3");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("action('consent','consent').\n");
        br.close();
        p = new Parser(fichier);
        listProcess = p.parserProcess();
        String expected = "consent";
        assertEquals(expected, listProcess.get(0));
    }

    @Test
    public void testParserProcessSeveralProcess() throws IOException{
        File fichier = new File("Files/fileProcess4");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("action('consent','consent').\n");
        br.write("used('consent','privacy_policy_template','template',16).\n");
        br.write("action('update','updateConsent').\n");
        br.write("used('createCookie','id_bob','id',21).\n");
        br.write("action('sendCookie','thirdParties').\n");
        br.close();
        p = new Parser(fichier);
        listProcess = p.parserProcess();
        String expected1 = "consent";
        String expected2 = "update";
        String expected3 = "sendCookie";
        assertEquals(expected1, listProcess.get(0));
        assertEquals(expected2, listProcess.get(1));
        assertEquals(expected3, listProcess.get(2));
    }

    @Test
    public void testParserProcessNumberProcess() throws IOException{
        File fichier = new File("Files/fileProcess5");
        FileWriter fw = new FileWriter(fichier);
        BufferedWriter br = new BufferedWriter(fw);
        br.write("action('consent','consent').\n");
        br.write("used('consent','privacy_policy_template','template',16).\n");
        br.write("action('update','updateConsent').\n");
        br.write("used('createCookie','id_bob','id',21).\n");
        br.write("action('sendCookie','thirdParties').\n");
        br.close();
        p = new Parser(fichier);
        listProcess = p.parserProcess();
        String expected1 = "consent";
        String expected2 = "update";
        String expected3 = "sendCookie";
        int numberExpected = 3;
        //la preuve que la redondance est egalement geree
        assertEquals(expected1, listProcess.get(0));
        assertEquals(expected2, listProcess.get(1));
        assertEquals(expected3, listProcess.get(2));
        assertEquals(numberExpected, listProcess.stream().count());
        assertThrows(IndexOutOfBoundsException.class, () -> listProcess.get(3));
    }

}
