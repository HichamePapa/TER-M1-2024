import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class testConverter {
    Converter c ;
    List<String> list = new ArrayList<>();
    List<String> listQuerries;

    @Test
    public void testNullQuery(){
        list.add("Lawfullness");
        c = new Converter( list, "chemin", null , null, null);
        listQuerries = c.ConvertToPrologQuery();
        String queryExpected = "?− legal(P, D, C, TG, T).";
        assertEquals(queryExpected, listQuerries.get(0));
    }

    @Test

    public void testQueryWithValues(){
        list.add("Lawfullness");
        list.add("Right-to-access");
        c = new Converter( list, "chemin", "dateDeNaissance" , "Alex", "consent");
        listQuerries = c.ConvertToPrologQuery();

        String queryExpected1 = "?− legal(consent, dateDeNaissance, C, TG, T).";
        String queryExpected2 = "?− rigthAccess(Alex).";

        assertEquals(queryExpected1, listQuerries.get(0));
        assertEquals(queryExpected2, listQuerries.get(1));
    }

    @Test
    public void testNumberQueries(){
        list.add("Lawfullness");
        list.add("Right-to-access");
        list.add("Right-to-erasure");
        c = new Converter(list,"path", "prenom", "bob", null);
        listQuerries = c.ConvertToPrologQuery();

        int numberExpected = 3;
        assertEquals(numberExpected, listQuerries.stream().count());
    }

    @Test
    public void testEmptyQuery(){
        c = new Converter(list,"path", "prenom", "bob", null);
        listQuerries = c.ConvertToPrologQuery();
        assertTrue(listQuerries.isEmpty());

    }

    @Test
    public void testIncompatibleQuery(){
        list.add("Lawfullness");
        list.add("Right-to-access");
        list.add("je ne suis pas un principe compatible");
        c = new Converter(list,"path", null, null, null);
        listQuerries = c.ConvertToPrologQuery();
        String queryExpected = "?− legal(P, D, C, TG, T).";
        String queryExpected2 = "?− rigthAccess(S).";

        int numberExpected = 2;
        assertEquals(numberExpected, listQuerries.stream().count());
        assertEquals(queryExpected, listQuerries.get(0));
        assertEquals(queryExpected2, listQuerries.get(1));
        assertThrows(IndexOutOfBoundsException.class, () -> listQuerries.get(2));

    }

}
