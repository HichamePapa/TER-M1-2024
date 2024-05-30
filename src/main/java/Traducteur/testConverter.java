package Traducteur;

import org.junit.Test;
import static org.junit.Assert.*;
import java.util.ArrayList;
import java.util.List;

public class testConverter {
    Converter c ;
    List<String> list = new ArrayList<>();
    List<String> listDatas = new ArrayList<>();
    List<String> listUsers = new ArrayList<>();
    List<String> listProcess = new ArrayList<>();
    List<String> listQuerries;


    @Test
    public void testNullQuery(){
        list.add("Lawfullness");
        c = new Converter( list, "chemin", null , null, null);
        listQuerries = c.ConvertToPrologQuery();
        String queryExpected = "legal(P, D, C, TG, T).";
        assertEquals(queryExpected, listQuerries.get(0));
    }

    @Test

    public void testQueryWithValues(){
        list.add("Lawfullness");
        list.add("Right-to-access");
        listDatas.add("dateDeNaissance");
        listUsers.add("Alex");
        listProcess.add("consent");
        c = new Converter( list, "chemin", listDatas , listUsers, listProcess);
        listQuerries = c.ConvertToPrologQuery();

        String queryExpected1 = "legal(consent, dateDeNaissance, C, TG, T).";
        String queryExpected2 = "rightAccess(Alex).";

        assertEquals(queryExpected1, listQuerries.get(0));
        assertEquals(queryExpected2, listQuerries.get(1));
    }

    @Test
    public void testNumberQueries(){
        list.add("Lawfullness");
        list.add("Right-to-access");
        list.add("Right-to-erasure");
        listDatas.add("prenom");
        listUsers.add("bob");
        c = new Converter(list,"path", listDatas, listUsers, null);
        listQuerries = c.ConvertToPrologQuery();

        int numberExpected = 3;
        assertEquals(numberExpected, listQuerries.stream().count());
    }

    @Test
    public void testEmptyQuery(){
        listDatas.add("prenom");
        listUsers.add("bob");
        c = new Converter(list,"path", listDatas, listUsers, null);
        listQuerries = c.ConvertToPrologQuery();
        assertTrue(listQuerries.isEmpty());

    }

    @Test
    public void testQueryWithSeveralArguments(){
        list.add("Lawfullness");
        listDatas.add("nom");
        listDatas.add("prenom");
        listProcess.add("consent");
        listProcess.add("update");
        c = new Converter(list,"path", listDatas, listUsers, listProcess);
        listQuerries = c.ConvertToPrologQuery();
        String queryExpected1 = "legal(consent, nom, C, TG, T).";
        String queryExpected2 = "legal(consent, prenom, C, TG, T).";
        String queryExpected3 = "legal(update, nom, C, TG, T).";
        String queryExpected4 = "legal(update, prenom, C, TG, T).";
        assertEquals(queryExpected1, listQuerries.get(0));
        assertEquals(queryExpected2, listQuerries.get(1));
        assertEquals(queryExpected3, listQuerries.get(2));
        assertEquals(queryExpected4, listQuerries.get(3));
    }

    @Test
    public void testIncompatibleQuery(){
        list.add("Lawfullness");
        list.add("Right-to-access");
        list.add("je ne suis pas un principe compatible");
        c = new Converter(list,"path", null, null, null);
        listQuerries = c.ConvertToPrologQuery();
        String queryExpected = "legal(P, D, C, TG, T).";
        String queryExpected2 = "rightAccess(S).";

        int numberExpected = 2;
        assertEquals(numberExpected, listQuerries.stream().count());
        assertEquals(queryExpected, listQuerries.get(0));
        assertEquals(queryExpected2, listQuerries.get(1));
        assertThrows(IndexOutOfBoundsException.class, () -> listQuerries.get(2));

    }



}
