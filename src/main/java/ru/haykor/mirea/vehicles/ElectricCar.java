package ru.haykor.mirea.vehicles;

public class ElectricCar extends Car implements ElectricVehicle {
    private double mBatteryCapacity;

    public ElectricCar() {
        super();
        mEngineType = "Electric";
    }

    public ElectricCar(String model, String license, String color, int year,
                        String ownerName, String insuranceNumber, double batteryCapacity) {
        super(model, license, color, year, ownerName, insuranceNumber);
        mEngineType = "Electric";
        mBatteryCapacity = batteryCapacity;
    }

    @Override
    public String vehicleType() {
        return "Electric Car";
    }

    @Override
    public double getBatteryCapacity() {
        return mBatteryCapacity;
    }

    @Override
    public void setBatteryCapacity(double batteryCapacity) {
        mBatteryCapacity = batteryCapacity;
    }

    @Override
    public String toString() {
        return "ElectricCar{" + super.toString() + ", BatteryCapacity=" + mBatteryCapacity + " kWh}";
    }
}
