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
public class Task1 {

    private static final Scanner sc = new Scanner(System.in);

    public static int[] loadArray() {
        int n = sc.nextInt();
        int[] array = new int[n];
        for (int i = 0; i < array.length; i++) {
            array[i] = sc.nextInt();
        }
        return array;
    }

    public static void printArray(int[] array) {
        for (int i = 0; i < array.length; i++) {
            System.out.print(array[i] + " ");
        }
        System.out.println("");
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

    public static int countDiff(int[] array) {
        int count = 1;
        if (array.length == 0) {
            return 0;
        }
        for (int i = 0; i < array.length - 1; i++) {
            if (array[i] != array[i + 1]) {
                count++;
            }
        }
        return count;
    }

    public static void main(String[] args) {
//        int[] array = loadArray();
//        printArray(array);
//        sortArray(array);
//        printArray(array);
//        System.out.println(countDiff(array));
//        System.out.println("---------------------");
//        System.out.println("Zadejte pocet posloupnosti: ");
//        int n = sc.nextInt();
//        int[][] arrays = new int[n][];
//
//        for (int i = 0; i < n; i++) {
//            System.out.println("Zadejte delku jednotlive posloupnosti: ");
//            int length = sc.nextInt();
//            arrays[i] = new int[length];
//            System.out.println("Zadejte hodnoty pro posloupnosti: ");
//            for (int j = 0; j < length; j++) {
//                arrays[i][j] = sc.nextInt();
//            }
//        }
//        int maxCountDiffValue = Integer.MIN_VALUE;
//        int maxCountDiffValueIndex = -1;
//        for (int i = 0; i < arrays.length; i++) {
//            sortArray(arrays[i]);
//            int countDiffValues = countDiff(arrays[i]);
//            System.out.println("Posloupnot " + (i + 1) + ": ");
//            printArray(arrays[i]);
//            if (countDiffValues > maxCountDiffValue) {
//                maxCountDiffValue = countDiffValues;
//                maxCountDiffValueIndex = i + 1;
//            }
//        }
//            System.out.println("Posloupnost s nejvice ruznymz hodnoty: "+ maxCountDiffValueIndex);
        int peaks;
        do {
            peaks = sc.nextInt();
            double[][] cords = new double[peaks][2];

            for (int i = 0; i < cords.length; i++) {
                for (int j = 0; j < cords[i].length; j++) {
                    cords[i][j] = sc.nextInt();
                }
            }

            System.out.println(circuit(cords, peaks));

        } while (peaks > 0);

    }

    public static double circuit(double[][] cords, int peaks) {
        double circuit = 0;
        for (int i = 0; i < peaks - 1; i++) {
            double distances = Math.sqrt(Math.pow((cords[i + 1][0] - cords[i][0]), 2) + Math.pow((cords[i + 1][1] - cords[i][1]), 2));
            circuit += distances;
        }
        double distanceLastFirst = Math.sqrt(Math.pow((cords[cords.length - 1][0] - cords[0][0]), 2) + Math.pow((cords[cords.length - 1][1] - cords[0][1]), 2));
        circuit += distanceLastFirst;
        return circuit;
    }
}
