/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lenguajesdeprogramacion.proyecto.a;

/**
 *
 * @author crist
 */
public class cNumero {
    private int valor;

    public cNumero(int valor) {
        this.valor = valor;
    }
    
    public boolean esPrimo() {
        if (valor <= 1) return false;
        for (int i = 2; i <= Math.sqrt(valor); i++) {
            if (valor % i == 0) return false;
        }
        return true;
    }

    public int getValor() {
        return valor;
    }
}
