package ru.haykor.mirea.geometry;

public class ComparableCircle extends Circle {

    public ComparableCircle(double radius) {
        super(radius);
    }

    @Override
    public int compareTo(GeometricObject o) {
        Circle other = (Circle) o;
        return Double.compare(getRadius(), other.getRadius());
    }
}
