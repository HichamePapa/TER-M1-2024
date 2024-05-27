package Interface.ter;

import Traducteur.Converter;
import Solver.Solver;

import java.io.IOException;

public class SolveController {
    private Converter converter;
    private Solver solver;

    public void setConverter(Converter converter) {
        this.converter = converter;
    }

    public void setSolver(Solver solver) {
        this.solver = solver;
    }

    public String solve() throws IOException {
        solver.setQueries(converter.ConvertToPrologQuery());
        solver.setProvenanceGraphPath(converter.getCheminGraphe());
        return solver.solve();
    }
}
