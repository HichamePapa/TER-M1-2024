package Solver;

import org.jpl7.*;
import org.junit.Test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class TestSolver {
    Solver s;
    String prop1A = "prop1('A')";
    String prop1B = "prop1('B')";
    String prop2A = "prop2('A')";
    String prop2B = "prop2('B')";
    String prop2C = "prop2('C')";
    String prop1 = "prop1(X)";
    String prop2 = "prop2(X)";
    List<String> terms = List.of(prop1A, prop1B, prop2A, prop2B, prop2C);
    List<String> termsSubsetA = List.of(prop1A, prop1B, prop2C);
    List<String> termsSubsetB = List.of(prop2A, prop2B);

    public void initEmptySolver() throws IOException {
        String path = "Solver/testfiles/SN_empty_prov_graph.pl";
        s = new Solver(path, new ArrayList<String>(), 0, 0, 0, 0);
    }

    @Test
    public void testLoadTermsFromList(){
        try {
            initEmptySolver();
        } catch (IOException e){
            fail("error initiating solver : " + e.getLocalizedMessage());
        }
        for (String st : terms){
            PrologException ex = assertThrows(PrologException.class, () -> new Query(st).hasSolution());
            assertTrue(ex.getMessage().contains("existence_error"));
        }
        //s.loadTermsFromList(termsSubsetA);
        s.predicatesLoad.add("prop1/1");
        s.predicatesLoad.add("prop2/1");
        for (String st : termsSubsetA){
            assertTrue(new Query(st).hasSolution());
        }
        for (String st : termsSubsetB){
            assertFalse(new Query(st).hasSolution());
        }
        assertEquals(2, new Query(prop1).allSolutions().length);
        assertEquals(1, new Query(prop2).allSolutions().length);
        s.resetSolver();
    }

    /*@Test
    public void testUnloadPredicate(){
        Query q1 = new Query(prop1);
        Query q2 = new Query(prop2);
        try {
            initEmptySolver();
        } catch (IOException e){
            fail("error initiating solver : " + e.getLocalizedMessage());
        }
        //s.loadTermsFromList(terms);
        s.predicatesLoad.add("prop1/1");
        s.predicatesLoad.add("prop2/1");
        s.unloadPredicate("prop2/1");
        assertEquals(2, q1.allSolutions().length);
        PrologException ex = assertThrows(PrologException.class, q2::hasSolution);
        assertTrue(ex.getMessage().contains("existence_error"));
        s.resetSolver();
    }*/



}
