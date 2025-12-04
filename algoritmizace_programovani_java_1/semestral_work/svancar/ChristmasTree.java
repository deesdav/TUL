package svancar;

import java.util.Scanner;

public class ChristmasTree {

    private static final Scanner sc = new Scanner(System.in);

    /**
     * Vykresleni vanocniho stromku
     * Test: 8 3
     * 
     * @param args
     */
    public static void main(String[] args) {

        System.out.println("Zadejte velikost koruny (n) a výšku kmene (k):");
        int n = sc.nextInt();
        int k = sc.nextInt();

        int maxWidth = n + 1;

        leaves(n, maxWidth);
        leaves(n + 1, maxWidth);
        stick(maxWidth, k);
    }

    /**
     * 
     * @param height
     * @param width
     */
    public static void leaves(int height, int width) {

        for (int i = 1; i <= height; i++) {
            for (int j = 1; j <= (width - i); j++) {
                System.out.print(" ");
            }
            for (int j = 1; j <= (2 * i - 1); j++) {
                System.out.print("*");
            }
            System.out.println("");
        }
    }

    /**
     * 
     * @param width
     * @param height
     */
    public static void stick(int width, int height) {

        for (int i = 1; i <= height; i++) {
            for (int j = 1; j <= width - 2; j++) {
                System.out.print(" ");
            }
            System.out.print("***");
            System.out.println("");
        }
    }

}
