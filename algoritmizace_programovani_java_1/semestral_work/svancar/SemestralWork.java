package svancar;

import java.util.Scanner;

/**
 *
 * @author dejvi
 */
public class SemestralWork {

    private static final Scanner sc = new Scanner(System.in);

    /**
     *
     * @param n
     * @return
     */
    public static int[][] loadMatrix(int n) {
        int[][] matrix = new int[n][n];
        System.out.println("Zadej matici");
        // nacteni hodnot do matice
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                matrix[i][j] = sc.nextInt();
            }
        }
        return matrix;
    }

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
            // osetruju kdyby se matice zredukovala na az na nulu
            if (matrixLength == 0) {
                return matrix;
            }
            // prochazim celou matici a hledam cislo v radku a sloupci pro smazani
            for (int i = 0; i < matrixLength; i++) {
                for (int j = 0; j < matrixLength; j++) {
                    // pokud nemam nulu a nenulove cislo je jedine v radku a jedine ve sloupci tak
                    // jsme nasli cislo - muzeme radek a sloupec odebrat neboli redukovat matici
                    if (matrix[i][j] != 0 && isOnlyRow(matrix, i, j) && isOnlyCol(matrix, i, j)) {
                        // provedu odebrani radku a sloupce pomoci pomocne metody
                        matrix = removeRowAndCol(matrix, i, j);
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
    /**
     * 
     * @param matrix
     * @param row
     * @param column
     * @return
     */
    private static boolean isOnlyRow(int[][] matrix, int row, int column) {
        for (int j = 0; j < matrix[row].length; j++) {
            // pokud najdu na jinem indexu nenulove cislo - vracim false
            if (j != column && matrix[row][j] != 0) {
                return false;
            }
        }
        return true;
    }

    // testovani: je jediny sloupec?
    /**
     * 
     * @param matrix
     * @param row
     * @param column
     * @return
     */
    private static boolean isOnlyCol(int[][] matrix, int row, int column) {
        for (int i = 0; i < matrix.length; i++) {
            if (i != row && matrix[i][column] != 0) {
                return false;
            }
        }
        return true;
    }

    // odebrani radku a sloupce
    /**
     * 
     * @param matrix
     * @param removedRow
     * @param removedColumn
     * @return
     */
    private static int[][] removeRowAndCol(int[][] matrix, int removedRow, int removedColumn) {
        int matrixLength = matrix.length;
        // pomocna nova matice o jeden radek a sloupec mensi
        int[][] newMatrix = new int[matrixLength - 1][matrixLength - 1];

        int rowIndexNewMatrix = 0; // index radku v nove matici
        for (int i = 0; i < matrixLength; i++) {
            if (i == removedRow) { // mazani radku > preskoceni
                continue;
            }
            int columnIndexNewMatrix = 0; // index sloupce v nove matici
            for (int j = 0; j < matrixLength; j++) {
                if (j == removedColumn) { // mazani sloupce > preskoceni
                    continue;
                }
                newMatrix[rowIndexNewMatrix][columnIndexNewMatrix] = matrix[i][j];
                columnIndexNewMatrix++; // posun doprava
            }
            rowIndexNewMatrix++; // posun dolu
        }
        return newMatrix;
    }

    /**
     *
     * @param matrix
     */
    public static void printMatrix(int[][] matrix) {
        // vypis matice
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

            int[][] reducedMatrix = reductionMatrix(loadedMatrix);
            System.out.println("Redukovana matice (" + reducedMatrix.length + " x " + reducedMatrix.length + ")");

            printMatrix(reducedMatrix);
            System.out.println("");
            // int[][] test = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
            // printMatrix(test);
        }
    }
}
