package com.example.proyectofinal;

import java.util.Scanner;

public class juego {
 
    private static char[][] tablero = new char[3][3];
    private static char jugadorActual = 'X';  
    private static boolean juegoTerminado = false;

       
    
    public static void main(String[] args) {
        menu();
    }
    
    public static void menu() {
        Scanner scanner = new Scanner(System.in);
        int opcion;
    
        do {
            System.out.println("Menú:");
            System.out.println("1. Comenzar juego");
            System.out.println("2. Reglas");
            System.out.println("3. Resumen");
            System.out.println("4. Créditos");
            System.out.println("0. Salir");
            System.out.print("Ingrese su opción: ");
            opcion = scanner.nextInt();
            
            borrarPantalla();
            
            switch (opcion) {
                case 1:
                    inicializarTablero();
                    jugar();
                    break;
                case 0:
                    System.out.println("Gracias por jugar.");
                    System.exit(0);
                    break;
                case 2:
                    System.out.println("Reglas del juego:");
                    System.out.println("1. El juego se juega en un tablero de 3x3.");
                    System.out.println("2. Dos jugadores, X y O, se turnan para colocar su marca en una casilla vacía.");
                    System.out.println("3. El juego termina cuando un jugador gana o cuando el tablero está lleno.");
                    break;
                case 3:
                    System.out.println("Resumen del juego:");
                    System.out.println("El juego es una versión simple del clásico juego de mesa Tic-Tac-Toe.");
                    System.out.println("El objetivo es ganar colocando tres marcas en línea, ya sea horizontal, vertical o diagonal.");
                    break;
                case 4:
                    System.out.println("Créditos:");
                    System.out.println("Desarrollado por.");
                    System.out.println("Eduardo Jafeth Maradiaga Canales");
                    System.out.println("Cristhian Ricardo Castro Borjas");
                    System.out.println("Versión 1.0.");
                    break;
                default:
                    System.out.println("Opción inválida. Por favor, inténtelo nuevamente.");
            }
        } while (opcion != 0);
    }

    
    public static void inicializarTablero() {
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                tablero[i][j] = ' '; 
            }
        }
    }

    public static void imprimirTablero() {
        System.out.println("-------------");
        for (int i = 0; i < 3; i++) {
            System.out.print("| ");
            for (int j = 0; j < 3; j++) {
                System.out.print(tablero[i][j] + " | ");
            }
            System.out.println();
            System.out.println("-------------");
        }
    }

    public static void jugar() {
        Scanner scanner = new Scanner(System.in);

        while (!juegoTerminado) {
            imprimirTablero();
            System.out.println("Jugador " + jugadorActual + ", elige una fila y columna (0, 1, 2) para colocar tu marca:");
            System.out.print("fila:");
            int fila = scanner.nextInt();
            System.out.print("columna:");
            int columna = scanner.nextInt();

            borrarPantalla();

            if (fila >= 0 && fila < 3 && columna >= 0 && columna < 3 && tablero[fila][columna] == ' ') {
                tablero[fila][columna] = jugadorActual; 

                if (verificarVictoria()) {
                    imprimirTablero();
                    System.out.println("¡Jugador " + jugadorActual + " gana!");
                    juegoTerminado = true;
                } else if (tableroLleno()) {
                    imprimirTablero();
                    System.out.println("¡Es un empate!");
                    juegoTerminado = true;
                } else {
                    jugadorActual = (jugadorActual == 'X') ? 'O' : 'X';
                }
            } else {
                System.out.println("Movimiento inválido. Intenta nuevamente.");
            }
        }
     
    }

    public static boolean verificarVictoria() {
        for (int i = 0; i < 3; i++) {
            if ((tablero[i][0] == jugadorActual && tablero[i][1] == jugadorActual && tablero[i][2] == jugadorActual) ||
                (tablero[0][i] == jugadorActual && tablero[1][i] == jugadorActual && tablero[2][i] == jugadorActual)) {
                return true;
            }
        }

        if ((tablero[0][0] == jugadorActual && tablero[1][1] == jugadorActual && tablero[2][2] == jugadorActual) ||
            (tablero[0][2] == jugadorActual && tablero[1][1] == jugadorActual && tablero[2][0] == jugadorActual)) {
            return true;
        }

        return false;
    }

    public static boolean tableroLleno() {
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                if (tablero[i][j] == ' ') {
                    return false;
                }
            }
        }
        return true;
    }

    public static void borrarPantalla(){
        System.out.print("\033[H\033[2J");
    }
}

