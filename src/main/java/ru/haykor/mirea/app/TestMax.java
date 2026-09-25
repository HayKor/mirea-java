package ru.haykor.mirea.app;

import ru.haykor.mirea.geometry.Circle;
import ru.haykor.mirea.geometry.ComparableCircle;
import ru.haykor.mirea.geometry.GeometricObject;
import ru.haykor.mirea.geometry.Rectangle;

public class TestMax {
    public static void main(String[] args) {
        Circle circle1 = new Circle(4);
        Circle circle2 = new Circle(5);
        GeometricObject maxCircle = GeometricObject.max(circle1, circle2);
        System.out.println("Наибольший круг имеет площадь " + maxCircle.getArea());

        Rectangle rectangle1 = new Rectangle(2, 3);
        Rectangle rectangle2 = new Rectangle(4, 1);
        GeometricObject maxRectangle = GeometricObject.max(rectangle1, rectangle2);
        System.out.println("Наибольший прямоугольник имеет площадь " + maxRectangle.getArea());

        ComparableCircle comparableCircle1 = new ComparableCircle(4);
        ComparableCircle comparableCircle2 = new ComparableCircle(5);
        ComparableCircle maxComparableCircle =
                comparableCircle1.compareTo(comparableCircle2) >= 0 ? comparableCircle1 : comparableCircle2;
        System.out.println("Наибольший ComparableCircle имеет радиус " + maxComparableCircle.getRadius());

        GeometricObject maxBetweenCircleAndRectangle = GeometricObject.max(circle1, rectangle1);
        System.out.println("Наибольший между кругом и прямоугольником имеет площадь "
                + maxBetweenCircleAndRectangle.getArea());
    }
}
