package ZkouskaWord;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author dejvi
 */
public class Task1A {

    public static boolean isChanging(int[] array) {
        for (int i = 0; i < array.length - 1; i++) {
            if (array[i] < 0 && array[i + 1] < 0) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {
        int[] arr = {2, -3, 6, -9};
        int[] arr2 = {2, 3, -6, -9};
        int[] arr3 = {-2, -3, 6, 9};
        int[] arr4 = {-2, 3, -6, 9};
        System.out.println(isChanging(arr));
        System.out.println(isChanging(arr2));
        System.out.println(isChanging(arr3));
        System.out.println(isChanging(arr4));
    }
}
