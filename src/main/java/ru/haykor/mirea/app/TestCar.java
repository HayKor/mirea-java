package ru.haykor.mirea.app;

import ru.haykor.mirea.vehicles.Car;
import ru.haykor.mirea.vehicles.ElectricCar;
import ru.haykor.mirea.vehicles.Vehicle;

public class TestCar {
    public static void main(String[] args) {
        Vehicle vehicle1 = new Car("BMW 3", "A100AA77", "Black", 2020, "Alex", "INS-111", "Gasoline");
        Vehicle vehicle2 = new ElectricCar("Tesla Model 3", "B200BB77", "White", 2022, "John", "INS-222", 75.0);

        vehicle1.setColor("Metallic Gray");
        vehicle1.setOwnerName("Dmitry");

        vehicle2.setLicense("E777EE77");
        vehicle2.setColor("Red");

        IO.println(vehicle1);
        IO.println(vehicle2);
    }
}
