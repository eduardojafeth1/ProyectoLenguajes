/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package lenguajesdeprogramacion.proyecto.a;

import java.util.Scanner;

/**
 *
 * @author crist
 */
public class Proyecto1A {

    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);
        System.out.println("Ingrese un número, para determinar si es primo o no");
        int n = scanner.nextInt();
                
        cNumero num = new cNumero(n);
        
        if(num.esPrimo()){
            System.out.println("Es primo");
        }else{
            System.out.println("No es primo");
        }
        
        scanner.close();
    }
}
