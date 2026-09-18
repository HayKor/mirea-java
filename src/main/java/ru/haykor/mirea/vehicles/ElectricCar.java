package ru.haykor.mirea.vehicles;

public class ElectricCar extends Car {
    private double mBatteryCapacity;

    public ElectricCar() {
        super();
        this.mEngineType = "Electric";
    }

    public ElectricCar(String model, String license, String color, int year,
                       String ownerName, String insuranceNumber, double batteryCapacity) {
        super(model, license, color, year, ownerName, insuranceNumber, "Electric");
        mBatteryCapacity = batteryCapacity;
    }

    public double getBatteryCapacity() {
        return mBatteryCapacity;
    }

    public void setBatteryCapacity(double batteryCapacity) {
        mBatteryCapacity = batteryCapacity;
    }

    @Override
    public String toString() {
        return "ElectricCar{" +
                "mModel='" + getModel() + '\'' +
                ", mLicense='" + getLicense() + '\'' +
                ", mColor='" + getColor() + '\'' +
                ", mYear=" + getYear() +
                ", mOwnerName='" + getOwnerName() + '\'' +
                ", mInsuranceNumber='" + getInsuranceNumber() + '\'' +
                ", mEngineType='" + mEngineType + '\'' +
                ", mBatteryCapacity=" + mBatteryCapacity +
                '}';
    }
}
