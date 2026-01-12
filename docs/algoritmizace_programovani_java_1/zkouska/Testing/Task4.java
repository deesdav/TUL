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
public class Task4 {

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
        int columns = sc.nextInt();
        if (rows <= 0 || columns <= 0) {
            return null;
        }
        double[][] rectangleMatrix = new double[rows][columns];

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

    public static boolean isOnlyPositiveMetrix(double[][] matrix) {
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                if (matrix[i][j] <= 0) {
                    return false;
                }
            }
        }
        return true;
    }

    public static double[][] normMatrix(double[][] matrix) {
        double maxAbs = -Double.MAX_VALUE;
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                double abs = Math.abs(matrix[i][j]);
                if (abs > maxAbs) {
                    maxAbs = abs;
                }
            }
        }
        if (maxAbs == 0 || maxAbs == Double.MAX_VALUE) {
            return matrix;
        }
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                matrix[i][j] /= maxAbs;
            }
        }
        return matrix;
    }

    public static void main(String[] args) {
//        long[] array = new long[100];
//        int count = 0;
//        while (count < array.length) {
//            long input = sc.nextLong();
//            if (input <= 0) {
//                break;
//            }
//            array[count] = input;
//            count++;
//        }
//        //usporadani
//        int minIndex;
//        for (int i = 0; i < count - 1; i++) {
//            minIndex = i;
//            for (int j = i + 1; j < count; j++) {
//                if (cipherProd(array[j]) < cipherProd(array[minIndex])) {
//                    minIndex = j;
//                }
//            }
//            long temp = array[i];
//            array[i] = array[minIndex];
//            array[minIndex] = temp;
//        }
//
//        double[][] matrix = loadRectangleMatrix();
//        printMatrix(matrix);
//        System.out.println(isOnlyPositiveMetrix(matrix));
//        double[][] normalizedMatrix = normMatrix(matrix);
//        printMatrix(normalizedMatrix);
        double[][] matrix;
        while (!false) {
            matrix = loadRectangleMatrix();
            if (matrix.length <= 0 || matrix[0].length <= 0) {
                break;
            }
            double[][] normalizedMatrix = normMatrix(matrix);
            printMatrix(normalizedMatrix);
        }
    }
}
