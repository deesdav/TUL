/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Testing;

import java.util.Scanner;

/**
 *
 * @author dejvi
 */
public class Task2 {

    private static final Scanner sc = new Scanner(System.in);

    public static int[][] horizontalSwap(int[][] matrix) {
        for (int i = 0; i < matrix.length / 2; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                int oppositeRow = matrix.length - i - 1;
                int temp = matrix[i][j];
                matrix[i][j] = matrix[oppositeRow][j];
                matrix[oppositeRow][j] = temp;
            }
        }
        return matrix;
    }

    public static boolean isNegativeDividedBySeven(int[] array) {
        for (int i = 0; i < array.length; i++) {
            if (array[i] >= 0 || array[i] % 7 != 0) {
                return false;
            }
        }
        return true;
    }

    public static void printMatrix(int[][] matrix) {
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                System.out.print(matrix[i][j] + " ");
            }
            System.out.println("");
        }
    }

    public static int cipherProd(int number) {
        int prod = 1;
        while (number > 0) {
            prod *= number % 10;
            number /= 10;
        }
        return prod;
    }

    public static void main(String[] args) {
//        int n = sc.nextInt();
//        double[][] points = new double[n][2];
//        double distance = 0;
//        for (int i = 0; i < points.length; i++) {
//            points[i][0] = sc.nextDouble();
//            points[i][1] = sc.nextDouble();
//        }
//        for (int i = 0; i < points.length; i++) {
//            for (int j = i + 1; j < points.length; j++) {
//                distance = Math.sqrt(Math.pow(points[j][0] - points[i][0], 2) + Math.pow(points[j][1] - points[i][1], 2));
//                System.out.println(i + " a bodu " + j + " je: " + distance);
//            }
//        }
        int number = 571;
        System.out.println(cipherProd(number));
    }
}
