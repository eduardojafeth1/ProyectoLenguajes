/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lenguajesdeprogramacion.proyecto.b;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author crist
 */
public class cFibonacci {
    public static List<Integer> generarSerie(int n) {
        List<Integer> serie = new ArrayList<>();
        if (n <= 0) return serie;

        serie.add(0);
        if (n == 1) return serie;

        serie.add(1);
        for (int i = 2; i < n; i++) {
            serie.add(serie.get(i - 1) + serie.get(i - 2));
        }
        return serie;
    }
}
