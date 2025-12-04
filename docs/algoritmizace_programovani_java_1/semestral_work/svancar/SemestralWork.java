package svancar;

import java.util.Scanner;

/**
 *
 * @author dejvi
 */
public class SemestralWork {

    private static final Scanner sc = new Scanner(System.in);

    // VANOCNI ULOHA
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

    // VYLOSOVANA ULOHA 24

    /**
     * Metoda, ktera nacita hodnoty do matice
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
     * Nejdulezitejsi metoda, ktera resi redukci matice a vuziva pomocne metody:
     * isOnlyRow, isOnlyCol, removeRowAndCol
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

    /**
     * Pomocna metoda, ktera resi jestli je na radku jen jedno nenulove cislo.
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

    /**
     * Pomocna metoda, ktera resi jestli je ve sloupci jen jedno nenulove cislo.
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

    /**
     * Pomocna metoda, ktera odebira radky sloupce pokud v nich bude stejne jedno
     * nenulove cislo a zbytek same nuly.
     * 
     * @param matrix
     * @param removedRow
     * @param removedColumn
     * @return
     */
    private static int[][] removeRowAndCol(int[][] matrix, int removedRow, int removedColumn) {
        int matrixLength = matrix.length;
        // pomocna promenna - nova matice o jeden radek a sloupec mensi
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
     * Metoda, ktera vypisuje matici
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
        System.out.println("SEMESTRAL WORK");
        int userChoice;
        do {
            System.out.println("Zadejte cisla 1 - Vanocni uloha, 2 - Vylosovana uloha, 0 - pro ukonceni programu.");
            userChoice = sc.nextInt();
            switch (userChoice) {
                // VANOCNI ULOHA
                case 1:
                    System.out.println("Zadejte velikost koruny (treeTop) a vysku kmene (treeTrunk):");
                    int treeTop = sc.nextInt();
                    int treeTrunk = sc.nextInt();

                    if (treeTop < 0 || treeTrunk < 0) {
                        System.out.println("Rozmery nemohou byt zaporne.");
                        break;
                    }

                    int maxWidth = treeTop + 1; // zarovnani na stred
                    leaves(treeTop, maxWidth);
                    leaves(treeTop + 1, maxWidth);
                    stick(maxWidth, treeTrunk);
                    break;
                // VYLOSOVANA ULOHA (REDUKOVANA MATICE)
                case 2:
                    System.out.println("Rozmer matice");
                    int matrixN = sc.nextInt();
                    if (matrixN <= 1) {
                        System.out.println("Pro redukci musi byt matice alespon 2x2.");
                        break;
                    }

                    int[][] loadedMatrix = loadMatrix(matrixN);
                    System.out.println("Puvodni matice: ");
                    printMatrix(loadedMatrix);

                    int[][] reducedMatrix = reductionMatrix(loadedMatrix);
                    System.out
                            .println("Redukovana matice (" + reducedMatrix.length + " x " + reducedMatrix.length + ")");
                    printMatrix(reducedMatrix);
                    System.out.println("");
                case 0:
                    System.out.println("Ukončuji program.");
                    break;

                default:
                    System.out.println("Neplatná volba, zkuste to znovu.");
                    break;
            }
            switch (userChoice) {
                // VANOCNI ULOHA
                case 1:
                    System.out.println("Zadejte velikost koruny (treeTop) a vysku kmene (treeTrunk):");
                    int treeTop = sc.nextInt();
                    int treeTrunk = sc.nextInt();

                    if (treeTop < 0 || treeTrunk < 0) {
                        System.out.println("Rozmery nemohou byt zaporne.");
                        break;
                    }

                    int maxWidth = treeTop + 1; // zarovnani na stred
                    leaves(treeTop, maxWidth);
                    leaves(treeTop + 1, maxWidth);
                    stick(maxWidth, treeTrunk);
                    break;
                // VYLOSOVANA ULOHA (REDUKOVANA MATICE)
                case 2:
                    System.out.println("Rozmer matice");
                    int matrixN = sc.nextInt();
                    if (matrixN <= 1) {
                        System.out.println("Pro redukci musi byt matice alespon 2x2.");
                        break;
                    }

                    int[][] loadedMatrix = loadMatrix(matrixN);
                    System.out.println("Puvodni matice: ");
                    printMatrix(loadedMatrix);

                    int[][] reducedMatrix = reductionMatrix(loadedMatrix);
                    System.out
                            .println("Redukovana matice (" + reducedMatrix.length + " x " + reducedMatrix.length + ")");
                    printMatrix(reducedMatrix);
                    System.out.println("");
                    break;
                case 0:
                    System.out.println("Ukončuji program.");
                    break;

                default:
                    System.out.println("Neplatná volba, zkuste to znovu.");
                    break;
            }
        } while (userChoice != 0);
    }
}
