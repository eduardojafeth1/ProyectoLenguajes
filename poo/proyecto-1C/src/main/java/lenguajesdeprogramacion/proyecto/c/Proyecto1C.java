/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package lenguajesdeprogramacion.proyecto.c;

import java.util.Scanner;

/**
 *
 * @author crist
 */
public class Proyecto1C {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        
        cConjunto numeros = new cConjunto();
        numeros.agregarElemento(1);
        numeros.agregarElemento(4);
        numeros.agregarElemento(6);
        numeros.agregarElemento(2);
        
        System.out.println("Ingrese el número que desa buscar en la serie");
        int num = scanner.nextInt();
        boolean contiene = numeros.contieneElemento(num);

        if(contiene){
            System.out.println("Lo contiene");
        }else{
            System.out.println("No lo contiene");
        }
    }
}
