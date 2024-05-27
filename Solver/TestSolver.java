package Solver;

import org.jpl7.*;
import org.jpl7.Integer;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import java.io.IOException;
import java.util.*;

import org.junit.Assert.*;

import static org.junit.Assert.*;

public class TestSolver {
    Solver s;

    /*Term prop1A = new Compound(
            "prop1",
            new Term[]{new Atom("A")}
    );
    Term prop1B = new Compound(
            "prop1",
            new Term[]{new Atom("B")}
    );
    Term prop2A = new Compound(
            "prop2",
            new Term[]{new Atom("A")}
    );
    Term prop2B = new Compound(
            "prop2",
            new Term[]{new Atom("B")}
    );
    Term prop2C = new Compound(
            "prop2",
            new Term[]{new Atom("C")}
    );*/
    Term prop1A = Term.textToTerm("prop1('A')");
    Term prop1B = Term.textToTerm("prop1('B')");
    Term prop1C = Term.textToTerm("prop1('C')");
    Term prop1D = Term.textToTerm("prop1('D')");
    Term prop2A = Term.textToTerm("prop2('A')");
    Term prop2B = Term.textToTerm("prop2('B')");
    Term prop2C = Term.textToTerm("prop2('C')");
    Term prop2D = Term.textToTerm("prop2('D')");
    Term prop3A = Term.textToTerm("prop3('A')");

    List<Term> terms = List.of(prop1A, prop1B, prop1C, prop1D,
            prop2A, prop2B, prop2C, prop2D, prop3A);
    List<Term> termsSubsetA = List.of(prop1A, prop1B, prop1C, prop2C);
    List<Term> termsSubsetB = List.of(prop2A, prop2B);
    List<Term> termsSubsetC = List.of(prop1D, prop2D);
    List<Term> termsSubsetD = List.of(prop3A);

    Query prop1 = new Query("prop1(X)");
    Query prop2 = new Query("prop2(X)");
    Query prop3 = new Query("prop3(X)");
    List<Query> queries = List.of(prop1, prop2, prop3);

    String emptyGraphPath = "Solver/testfiles/empty_prov_graph.pl";
    String termsSubsetCPath = "Solver/testfiles/testLoadPrologFile_subsetC.pl";
    String termsSubsetDPath = "Solver/testfiles/testLoadPrologFile_subsetD.pl";

    public void initEmptySolver() throws IOException {
        // JPL.setDefaultInitArgs(new String[]{"-q", "--no-signals"});
        s = new Solver(emptyGraphPath, new ArrayList<String>(), 0, 0, 0, 0);
        System.out.println("init");
    }

    @Before
    public void init() throws IOException {
        initEmptySolver();
    }

    @After
    public void reset(){
        s.resetSolver();
    }

    @Test
    public void testLoadTermsFromList() throws IOException {
        //initEmptySolver();
        for (Query q : queries){
            PrologException ex = assertThrows(PrologException.class, q::hasSolution);
            assertTrue(ex.getMessage().contains("existence_error"));
        }
        s.loadTermsFromList(termsSubsetA);
        for (Term t : termsSubsetA){
            assertTrue(new Query(t).hasSolution());
        }
        for (Term t : termsSubsetB){
            assertFalse(new Query(t).hasSolution());
        }
        assertEquals(3, prop1.allSolutions().length);
        assertEquals(1, prop2.allSolutions().length);
    }

    @Test
    public void testUnloadAllPredicates() throws IOException {
        //initEmptySolver();
        s.loadTermsFromList(termsSubsetA);
        s.unloadAllPredicates();
        PrologException ex = assertThrows(PrologException.class, prop1::hasSolution);
        assertTrue(ex.getMessage().contains("existence_error"));
        ex = assertThrows(PrologException.class, prop2::hasSolution);
        assertTrue(ex.getMessage().contains("existence_error"));
        //s.resetSolver();
    }

    @Test
    public void testLoadPrologFile() throws IOException {
        //initEmptySolver();
        s.loadPrologFile(termsSubsetCPath);
        for (Term t : termsSubsetC){
            assertTrue(new Query(t).hasSolution());
        }
        for (Term t : termsSubsetD){
            PrologException ex = assertThrows(PrologException.class, prop3::hasSolution);
            assertTrue(ex.getMessage().contains("existence_error"));
        }
        s.loadPrologFile(termsSubsetDPath);
        for (Term t : termsSubsetC){
            assertTrue(new Query(t).hasSolution());
        }
        for (Term t : termsSubsetD){
            assertTrue(new Query(t).hasSolution());
        }
        //s.resetSolver();
    }

    @Test
    public void testUnloadAllFiles() throws IOException {
        //initEmptySolver();
        s.loadPrologFile(termsSubsetCPath);
        s.loadPrologFile(termsSubsetDPath);
        s.unloadAllFiles();
        PrologException ex = assertThrows(PrologException.class, prop1::hasSolution);
        assertTrue(ex.getMessage().contains("existence_error"));
        ex = assertThrows(PrologException.class, prop2::hasSolution);
        assertTrue(ex.getMessage().contains("existence_error"));
        //s.resetSolver();
    }

    @Test
    public void testResetSolver(){
        s.loadTermsFromList(terms);
        try {
            s.loadPrologFile(termsSubsetCPath);
            s.loadPrologFile(termsSubsetDPath);
        } catch (IOException e) {
            fail(e.getLocalizedMessage());
        }
        s.resetSolver();
        PrologException ex = assertThrows(PrologException.class, prop1::hasSolution);
        assertTrue(ex.getMessage().contains("existence_error"));
        ex = assertThrows(PrologException.class, prop2::hasSolution);
        assertTrue(ex.getMessage().contains("existence_error"));
    }

    @Test
    public void testLoadTimeTerms(){
        Random random = new Random();
        int tCurrent = random.nextInt();
        String[] limits = new String[]{"access", "erase", "storage"};
        int[] limitValues = new int[]{random.nextInt(), random.nextInt(), random.nextInt()};
        s.setCurrentTime(tCurrent);
        s.setAccessTimeLimit(limitValues[0]);
        s.setEraseTimeLimit(limitValues[1]);
        s.setStorageTimeLimit(limitValues[2]);
        s.loadTimeTerms();
        Query q = new Query("tCurrent", new Variable("X"));
        Map<String, Term> sol = q.nextSolution();
        assertEquals(new Integer(tCurrent), sol.get("X"));
        assertFalse(q.hasMoreSolutions());
        for (int i = 0; i < limits.length; i++) {
            String s = limits[i];
            q = new Query("tLimit", new Term[]{new Atom(s), new Variable("X")});
            sol = q.nextSolution();
            assertEquals(new Integer(limitValues[i]), sol.get("X"));
            assertFalse(q.hasMoreSolutions());
        }
    }



}
