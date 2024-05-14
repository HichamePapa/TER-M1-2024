package Solver;

import org.jpl7.*;
import org.junit.Test;
import org.junit.Assert.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class TestSolver {
    Solver s;
    String prop1A = "prop1(A)";
    String prop1B = "prop1(B)";
    String prop2A = "prop2(A)";
    String prop2B = "prop2(B)";
    String prop2C = "prop2(C)";
    List<String> predicates = List.of(prop1A, prop1B, prop2A, prop2B, prop2C);
    List<String> predicatesSubset = List.of(prop1A, prop1B, prop2C);

    public void initEmptySolver() throws IOException {
        s = new Solver("testfiles/SN_empty_prov_graph.pl", new ArrayList<String>(), 0, 0, 0, 0);
    }

    @Test
    public void testLoadPredicatesFromList(){
        for (String s : predicates){
            PrologException ex = assertThrows(PrologException.class, () -> new Query(s).hasSolution());
            assertTrue(ex.getMessage().contains("existence_error"));
        }

    }


}
