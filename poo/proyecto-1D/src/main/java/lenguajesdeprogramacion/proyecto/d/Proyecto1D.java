/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package lenguajesdeprogramacion.proyecto.d;

import java.util.Scanner;

/**
 *
 * @author crist
 */

/*Máximo común divisor de un´número*/
public class Proyecto1D {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        cMCD mcd = new cMCD();

        System.out.println("Ingrese el pirmer número: ");
        int n1 = scanner.nextInt();
        System.out.println("Ingrese el segundo númeor: ");
        int n2 = scanner.nextInt();
        mcd.setN1(n1);
        mcd.setN2(n2);
        System.out.println("El máximo comun divisor de n1 y n2 es: ");
        System.out.println(mcd.calcularMCD());
    }
}
