/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lenguajesdeprogramacion.proyecto.d;

/**
 *
 * @author crist
 */
public class cMCD {
    private int n1;
    private int n2;

    public cMCD() {
    }

    public int getN1() {
        return n1;
    }

    public void setN1(int n1) {
        this.n1 = n1;
    }

    public int getN2() {
        return n2;
    }

    public void setN2(int n2) {
        this.n2 = n2;
    }
    
    public cMCD(int numero1, int numero2) {
        this.n1 = numero1;
        this.n2 = numero2;
    }
    
    public int calcularMCD() {
        int a = Math.abs(n1);
        int b = Math.abs(n2);

        // Algoritmo de Euclides
        while (b != 0) {
            int vTemp = b;
            b = a % b;
            a = vTemp;
        }
        return a;
    }
}
