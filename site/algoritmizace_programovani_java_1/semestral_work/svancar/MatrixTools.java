
package svancar;

import java.util.Scanner;

/**
 *
 * @author dejvi
 */
public class MatrixTools {

    // a
    public static double[][] sum(double[][] a, double[][] b) {
        if (a.length != b.length || a[0].length != b[0].length) {
            throw new IllegalArgumentException("Nevhodny roymer matic");
        }
        double[][] c = new double[a.length][a[0].length];
        for (int i = 0; i < c.length; i++) {
            for (int j = 0; j < c[i].length; j++) {
                c[i][j] = a[i][j] + b[i][j];
            }
        }
        return c;
    }

    public static void printMatrix(double[][] a) {
        for (int i = 0; i < a.length; i++) {
            for (int j = 0; j < a[i].length; j++) {
                System.out.format("%5.2f ", a[i][j]);
            }
            System.out.println("");
        }
    }

    public static double[][] norm(double[][] a) {
        double[][] norm = new double[a.length][a[0].length];

        double maxAbs = -Double.MAX_VALUE;
        double abs;
        // 1. prevedeni matice na normovany tvar 
        for (int i = 0; i < a.length; i++) {
            for (int j = 0; j < a[i].length; j++) {
                abs = Math.abs(a[i][j]);
                if (abs > maxAbs) {
                    maxAbs = abs;
                }
            }
        }
        // 2. podelit vsechny hodnoty max abs
        for (int i = 0; i < a.length; i++) {
            for (int j = 0; j < a[i].length; j++) {
                norm[i][j] = a[i][j] / maxAbs;
            }
        }
        return norm;
    }

    public static boolean isStochastic(double[][] a) {
        double sumRow;
        for (int i = 0; i < a.length; i++) {
            sumRow = 0; // vynulovani sumy pro kazdy radek
            for (int j = 0; j < a[i].length; j++) {
                if (a[i][j] < 0) {
                    return false;
                }
                sumRow = sumRow + a[i][j];
            }
            if (sumRow != 1) {
                return false;
            }
        }
        return true;
    }

    public static double[][] load() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Zadej rozmery matice");
        int m = sc.nextInt();
        int n = sc.nextInt();
        double[][] a = new double[m][n];
        System.out.println("Zadej hodnoty matice");
        for (int i = 0; i < a.length; i++) {
            for (int j = 0; j < a[0].length; j++) {
                a[i][j] = sc.nextDouble();
            }
        }
        return a;
    }

    public static boolean isSymetricByMainDiagonal(double[][] a) {
        for (int i = 0; i < a.length - 1; i++) {
            for (int j = i + 1; j < a[0].length; j++) {
                if (a[i][j] != a[j][i]) {
                    return false;
                }
            }
        }
        return true;
    }

    // testing main
    public static void main(String[] args) {
        double[][] test1 = {{1, 12, 3}, {5, 4, 1}};
        double[][] test2 = {{1, 1, 1}, {1, 1, 1}};
        printMatrix(sum(test1, test2));
        System.out.println("");
        printMatrix(norm(test1));
        double[][] test3 = {{0.5, 0, 0.5}, {0.2, 0.4, 0.4}};
        System.out.println(isStochastic(test3));
//        System.out.println("Test load");
//        double[][] loaded = load();
//        printMatrix(loaded);
        double[][] test4 = {{1, 5, 3},
                           {5, 4, 3},
                           {3, 3, 9}};
        System.out.println(isSymetricByMainDiagonal(test4));

    }

}
