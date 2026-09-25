package ru.haykor.mirea.generics;

import java.util.ArrayList;

public class CollectionUtils {

    public static <E> ArrayList<E> withoutDuplicates(ArrayList<E> list) {
        ArrayList<E> result = new ArrayList<>();
        for (E element : list) {
            if (!result.contains(element)) {
                result.add(element);
            }
        }
        return result;
    }

    public static <E> int linearSearch(E[] array, E key) {
        for (int i = 0; i < array.length; i++) {
            if (array[i].equals(key)) {
                return i;
            }
        }
        return -1;
    }

    public static <E extends Comparable<E>> E findMax(E[] array) {
        E max = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i].compareTo(max) > 0) {
                max = array[i];
            }
        }
        return max;
    }

    public static <E extends Comparable<E>> E findMax(E[][] array) {
        E max = array[0][0];
        for (E[] row : array) {
            for (E element : row) {
                if (element.compareTo(max) > 0) {
                    max = element;
                }
            }
        }
        return max;
    }
}
