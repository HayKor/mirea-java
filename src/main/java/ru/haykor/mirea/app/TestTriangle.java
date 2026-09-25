package ru.haykor.mirea.app;

import java.util.Scanner;

import ru.haykor.mirea.geometry.IllegalTriangleException;
import ru.haykor.mirea.geometry.Triangle;

public class TestTriangle {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Введите три стороны треугольника: ");
        double side1 = scanner.nextDouble();
        double side2 = scanner.nextDouble();
        double side3 = scanner.nextDouble();

        System.out.print("Введите цвет: ");
        String color = scanner.next();

        System.out.print("Треугольник закрашен? (true/false): ");
        boolean filled = scanner.nextBoolean();

        try {
            Triangle triangle = new Triangle(side1, side2, side3);
            triangle.setColor(color);
            triangle.setFilled(filled);

            System.out.println(triangle);
            System.out.println("Площадь: " + triangle.getArea());
            System.out.println("Периметр: " + triangle.getPerimeter());
            System.out.println("Цвет: " + triangle.getColor());
            System.out.println("Закрашен: " + triangle.isFilled());
        } catch (IllegalTriangleException e) {
            System.out.println("Ошибка: " + e.getMessage());
        }

        scanner.close();
    }
}
