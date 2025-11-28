package svancar;

import java.util.Scanner;

/**
 *
 * @author dejvi
 */
public class SemestralWork {

    private static final Scanner sc = new Scanner(System.in);

    // nacitani hodnot do matice
    /**
     *
     * @param n
     * @return
     */
    public static int[][] loadMatrix(int n) {
        int[][] matrix = new int[n][n];
        System.out.println("Zadej matici");
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                matrix[i][j] = sc.nextInt();
            }
        }
        return matrix;
    }

    // redukce matice
    /**
     *
     * @param matrix
     * @return
     */
    public static int[][] reductionMatrix(int[][] matrix) {
        boolean founded;
        do {
            founded = false;
            int matrixLength = matrix.length;
            if (matrixLength == 0) {
                return matrix;
            }
            for (int i = 0; i < matrixLength; i++) {
                for (int j = 0; j < matrixLength; j++) {
                    if (matrix[i][j] != 0) {
                        founded = true;
                        break;
                    }
                }
                if (founded) {
                    break;
                }
            }
        } while (founded);
        return matrix;
    }

    // POMOCNE METODY
    // testovani: je jediny radek?
    private static boolean isOnlyRow(int[][] matrix) {
        return true;
    }

    // testovani: je jediny sloupec?
    private static boolean isOnlyCol(int[][] matrix) {
        return true;
    }

    // odebrani radku a sloupce
    private static int[][] removeRowAndCol(int[][] matrix) {
        return null;
    }

    // vypis matice
    /**
     *
     * @param matrix
     */
    public static void printMatrix(int[][] matrix) {
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                System.out.format("%3d ", matrix[i][j]);
            }
            System.out.println("");
        }
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        while (true) {
            System.out.println("Rozmer matice");
            int n = sc.nextInt();
            if (n <= 0) {
                break;
            }
            int[][] loadedMatrix = loadMatrix(n);
            printMatrix(loadedMatrix);
            
//            int[][] reducedMatrix = reductionMatrix(loadedMatrix);
//            System.out.println("Redukovana matice (" + reducedMatrix.length + " x " + reducedMatrix.length + ")");
//            printMatrix(reducedMatrix);
            
            System.out.println("");
//            int[][] test = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
//            printMatrix(test);
        }
    }
}
