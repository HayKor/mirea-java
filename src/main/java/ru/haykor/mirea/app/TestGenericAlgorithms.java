package ru.haykor.mirea.app;

import java.util.ArrayList;
import java.util.List;

import ru.haykor.mirea.generics.Circle;
import ru.haykor.mirea.generics.CollectionUtils;

public class TestGenericAlgorithms {
    public static void main(String[] args) {
        ArrayList<Integer> numbers = new ArrayList<>(List.of(1, 2, 2, 3, 3, 3, 4));
        System.out.println("Без дубликатов: " + CollectionUtils.withoutDuplicates(numbers));

        Integer[] array = {5, 3, 9, 1, 7};
        System.out.println("Позиция 9: " + CollectionUtils.linearSearch(array, 9));
        System.out.println("Позиция 42: " + CollectionUtils.linearSearch(array, 42));

        Circle[] circles = {new Circle(2.0), new Circle(5.5), new Circle(3.1)};
        System.out.println("Наибольший круг: " + CollectionUtils.findMax(circles));

        Circle[][] circleGrid = {
                {new Circle(1.0), new Circle(4.0)},
                {new Circle(6.5), new Circle(2.0)}
        };
        System.out.println("Наибольший круг в матрице: " + CollectionUtils.findMax(circleGrid));
    }
}
