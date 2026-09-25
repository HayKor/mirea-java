package ru.haykor.mirea.app;

import ru.haykor.mirea.geometry.Circle;
import ru.haykor.mirea.geometry.Colorable;
import ru.haykor.mirea.geometry.GeometricObject;
import ru.haykor.mirea.geometry.Rectangle;
import ru.haykor.mirea.geometry.Square;

public class TestColorable {
    public static void main(String[] args) {
        GeometricObject[] objects = {
                new Circle(3),
                new Rectangle(2, 5),
                new Square(4),
                new Square(2.5),
                new Circle(1.5)
        };

        for (GeometricObject object : objects) {
            System.out.println("Площадь: " + object.getArea());

            if (object instanceof Colorable colorable) {
                colorable.howToColor();
            }
        }
    }
}
