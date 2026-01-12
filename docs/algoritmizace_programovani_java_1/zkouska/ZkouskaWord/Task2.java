/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ZkouskaWord;

/**
 *
 * @author dejvi
 */
public class Task2 {

    public static boolean isStochastic(double[][] matrix) {
        for (int i = 0; i < matrix.length; i++) {
            double sum = 0;
            for (int j = 0; j < matrix[i].length; j++) {
                if (matrix[i][j] < 0) {
                    return false;
                }
                sum += matrix[i][j];

            }
            if (Math.round(sum) != 1.0) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {
        double matrix[][] = {{0.3, 0.6, 0.1}, {0.3, 0.6, 0.1}};
        System.out.println(isStochastic(matrix));
    }
}
