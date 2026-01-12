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
public class Task1C {

    public static int[] theMostDividers(int[] array) {
        int[] resultArrray = new int[3];
        for (int i = 0; i < array.length; i++) {
            for (int j = i; j < array.length - 1; j++) {
                int count = 0;
                int limit = Math.min(array[j], array[j + 1]);
                for (int k = 2; k < limit; k++) {
                    if (array[j] % k == 0 && array[j + 1] % k == 0) {
                        count++;
                    }
                }

                resultArrray[0] = array[j];
                resultArrray[1] = array[j + 1];
                resultArrray[2] = count;

            }
        }
        return resultArrray;
    }

    public static void main(String[] args) {
        int[] array = {3, 2, 24, 48};
        System.out.println(Arrays.toString(theMostDividers(array)));
    }
}
