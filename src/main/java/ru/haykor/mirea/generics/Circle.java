package ru.haykor.mirea.generics;

public class Circle implements Comparable<Circle> {
    private double radius;

    public Circle(double radius) {
        this.radius = radius;
    }

    public double getRadius() {
        return radius;
    }

    @Override
    public int compareTo(Circle o) {
        return Double.compare(radius, o.radius);
    }

    @Override
    public String toString() {
        return "Circle{radius=" + radius + "}";
    }
}
