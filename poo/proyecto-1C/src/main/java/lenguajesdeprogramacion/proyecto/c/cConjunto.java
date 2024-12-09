/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lenguajesdeprogramacion.proyecto.c;

/**
 *
 * @author crist
 */
import java.util.HashSet;
import java.util.Set;

public class cConjunto {
    private Set<Integer> elementos;

    public cConjunto() {
        this.elementos = new HashSet<>();
    }

    public void agregarElemento(int elemento) {
        elementos.add(elemento);
    }

    public boolean contieneElemento(int elemento) {
        return elementos.contains(elemento);
    }
}
