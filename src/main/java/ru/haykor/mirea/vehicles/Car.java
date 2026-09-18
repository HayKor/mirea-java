package ru.haykor.mirea.vehicles;

public class Car extends Vehicle {
    private static final int CURRENT_YEAR = 2026;

    public Car() {
        super();
    }

    public Car(String model, String license, String color, int year,
               String ownerName, String insuranceNumber, String engineType) {
        super(model, license, color, year, ownerName, insuranceNumber, engineType);
    }

    public Car(String model, int year) {
        super();
        setModel(model);
        setYear(year);
    }

    @Override
    public String vehicleType() {
        return "Car";
    }

    public int getAge() {
        return CURRENT_YEAR - getYear();
    }

    @Override
    public String toString() {
        return "Car{" + super.toString() + "}";
    }
}
