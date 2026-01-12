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
public class Task5 {

    private static final Scanner sc = new Scanner(System.in);

    public static int[] loadArray() {
        int n = sc.nextInt();
        int[] array = new int[n];
        for (int i = 0; i < array.length; i++) {
            array[i] = sc.nextInt();
        }
        return array;
    }

    public static int[] sortArray(int[] array) {
        for (int i = 0; i < array.length - 1; i++) {
            int minIndex = i;
            for (int j = i + 1; j < array.length; j++) {
                if (array[j] < array[minIndex]) {
                    minIndex = j;
                }
            }
            int temp = array[i];
            array[i] = array[minIndex];
            array[minIndex] = temp;
        }
        return array;
    }

    public static int[] mergeArrays(int[] firstArray, int[] secondArray) {
        int[] resultArray = new int[firstArray.length + secondArray.length];
        int i = 0;
        int j = 0;
        int k = 0;
        while (i < firstArray.length && j < secondArray.length) {
            if (firstArray[i] < secondArray[j]) {
                resultArray[k] = firstArray[i];
                i++;
            } else {
                resultArray[k] = secondArray[j];
                j++;
            }
            k++;
        }
        while (i < firstArray.length) {
            resultArray[k] = firstArray[i];
            i++;
            k++;
        }
        while (j < secondArray.length) {
            resultArray[k] = secondArray[j];
            j++;
            k++;
        }
        return resultArray;
    }

    public static double[][] loadMatrix() {
        int rows = sc.nextInt();
        int cols = sc.nextInt();
        double[][] matrix = new double[rows][cols];
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                matrix[i][j] = sc.nextDouble();
            }
        }
        return matrix;
    }

    public static void printMatrix(double[][] matrix) {
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                System.out.print(matrix[i][j] + " ");
            }
            System.out.println("");
        }
    }

    public static void main(String[] args) {
//        int[] arrayOne = loadArray();
//        int[] arrayTwo = loadArray();
//        int[] sortedArrayOne = sortArray(arrayOne);
//        int[] sortedArrayTwo = sortArray(arrayTwo);
//        int[] fullArray = mergeArrays(sortedArrayOne, sortedArrayTwo);
//        System.out.println(Arrays.toString(fullArray));
//        double[][] matrix = loadMatrix();

        int n;
        do {
            n = sc.nextInt();
            double[][] matrix = new double[n][n];
            for (int i = 0; i < matrix.length; i++) {
                for (int j = 0; j < matrix[i].length; j++) {
                    matrix[i][j] = sc.nextDouble();
                }
            }

            boolean isSymetric = true;
            double[][] symetricPart = new double[n][n];
            double[][] antisymetricPart = new double[n][n];
            for (int i = 0; i < matrix.length; i++) {
                for (int j = 0; j < matrix[i].length; j++) {
                    if (matrix[i][j] != matrix[j][i]) {
                        isSymetric = false;
                        break;
                    }
                }
                if (isSymetric) {
                    break;
                }
            }

            if (isSymetric) {
                printMatrix(matrix);
                System.out.println(isSymetric);
            } else {
                for (int k = 0; k < n; k++) {
                    for (int l = 0; l < n; l++) {
                        symetricPart[k][l] = (matrix[k][l] + matrix[l][k]) / 2;
                        antisymetricPart[k][l] = (matrix[k][l] - matrix[l][k]) / 2;
                    }
                }
                System.out.println("Symetricka cast: ");
                printMatrix(symetricPart);
                System.out.println("Antisymetricka cast");
                printMatrix(antisymetricPart);
            }
        } while (n <= 0);

    }

}
