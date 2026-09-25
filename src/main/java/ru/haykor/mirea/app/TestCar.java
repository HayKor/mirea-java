package ru.haykor.mirea.app;

import ru.haykor.mirea.vehicles.Car;
import ru.haykor.mirea.vehicles.ElectricCar;
import ru.haykor.mirea.vehicles.Vehicle;

public class TestCar {
    public static void main(String[] args) {
        Vehicle car = new Car("BMW 3", "A100AA77", "Black", 2020, "Alex", "INS-111");
        Vehicle electricCar = new ElectricCar("Tesla Model 3", "B200BB77", "White", 2022, "John", "INS-222", 75.0);

        car.setYear(2021);
        car.setOwnerName("Dmitry");
        car.setInsuranceNumber("INS-333");

        electricCar.setYear(2023);
        electricCar.setOwnerName("Ivan");
        electricCar.setInsuranceNumber("INS-444");

        ElectricCar tesla = (ElectricCar) electricCar;
        System.out.println("Battery capacity: " + tesla.getBatteryCapacity() + " kWh");

        System.out.println(car);
        System.out.println(electricCar);
    }
}
