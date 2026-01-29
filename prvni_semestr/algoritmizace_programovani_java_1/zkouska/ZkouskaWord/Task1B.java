/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ZkouskaWord;

import java.util.Arrays;

/**
 *
 * @author dejvi
 */
public class Task1B {

    public static int[] oneSequence(int[][] matrix) {

        int countOfMatrixLength = 0;
        for (int i = 0; i < matrix.length; i++) {
            countOfMatrixLength += matrix[i].length;
        }
        int[] resultArray = new int[countOfMatrixLength];
        int k = 0;
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                resultArray[k] = matrix[i][j];
                k++;
            }
        }
        return resultArray;
    }

    public static void main(String[] args) {
        int[][] matrix = {
            {1, 2, 3, 4},
            {1, 2},
            {1, 2, 3}};
        System.out.println(Arrays.toString(oneSequence(matrix)));
    }
}
