/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Testing;

import java.util.Arrays;
import java.util.Scanner;

/**
 *
 * @author dejvi
 */
public class Task3 {

    private static final Scanner sc = new Scanner(System.in);

    public static long cipherProd(long number) {
        long prod = 1;
        while (number > 0) {
            prod *= number % 10;
            number /= 10;
        }
        return prod;
    }

    public static double[][] loadRectangleMatrix() {
        int rows = sc.nextInt();
        int cols = sc.nextInt();

        if (rows <= 0 || cols <= 0) {
            return null;
        }
        double[][] rectangleMatrix = new double[rows][cols];

        for (int i = 0; i < rectangleMatrix.length; i++) {
            for (int j = 0; j < rectangleMatrix[i].length; j++) {
                rectangleMatrix[i][j] = sc.nextDouble();
            }
        }
        return rectangleMatrix;
    }

    public static void printMatrix(double[][] matrix) {
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                System.out.print(matrix[i][j] + " ");
            }
            System.out.println("");
        }
    }

    public static boolean isSymetric(double[][] matrix) {
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                if (matrix[i][j] != matrix[j][i]) {
                    return false;
                }
            }
        }
        return true;
    }

    public static void main(String[] args) {
//        long number = 571;
//        System.out.println(cipherProd(number));
//        int n = 4;
//        long[] array = new long[n];
//        System.out.println("Zadejte hodnoty posloupnosti: ");
//        for (int i = 0; i < array.length; i++) {
//            array[i] = sc.nextLong();
//            if (array[i] <= 0) {
//                break;
//            }
//        }
//        for (int i = 0; i < array.length - 1; i++) {
//            int minIndex = i;
//            for (int j = i + 1; j < array.length; j++) {
//                if (cipherProd(array[j]) < cipherProd(array[minIndex])) {
//                    minIndex = j;
//                }
//            }
//            long temp = array[i];
//            array[i] = array[minIndex];
//            array[minIndex] = temp;
//        }
//        System.out.println(Arrays.toString(array));
        double[][] matrix = loadRectangleMatrix();
        printMatrix(matrix);
        System.out.println(isSymetric(matrix));
    }
}
