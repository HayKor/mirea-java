package ru.haykor.mirea.vehicles;

public abstract class Vehicle {
    private String mModel;
    private String mLicense;
    private String mColor;
    private int mYear;
    private String mOwnerName;
    private String mInsuranceNumber;
    protected String mEngineType;

    public Vehicle() {
    }

    public Vehicle(String model, String license, String color, int year,
                    String ownerName, String insuranceNumber, String engineType) {
        mModel = model;
        mLicense = license;
        mColor = color;
        mYear = year;
        mOwnerName = ownerName;
        mInsuranceNumber = insuranceNumber;
        mEngineType = engineType;
    }

    public abstract String vehicleType();

    public String getModel() {
        return mModel;
    }

    public void setModel(String model) {
        mModel = model;
    }

    public String getLicense() {
        return mLicense;
    }

    public void setLicense(String license) {
        mLicense = license;
    }

    public String getColor() {
        return mColor;
    }

    public void setColor(String color) {
        mColor = color;
    }

    public int getYear() {
        return mYear;
    }

    public void setYear(int year) {
        mYear = year;
    }

    public String getOwnerName() {
        return mOwnerName;
    }

    public void setOwnerName(String ownerName) {
        mOwnerName = ownerName;
    }

    public String getInsuranceNumber() {
        return mInsuranceNumber;
    }

    public void setInsuranceNumber(String insuranceNumber) {
        mInsuranceNumber = insuranceNumber;
    }

    public String getEngineType() {
        return mEngineType;
    }

    public void setEngineType(String engineType) {
        mEngineType = engineType;
    }

    @Override
    public String toString() {
        return "Type=" + vehicleType() +
                ", Model='" + mModel + '\'' +
                ", License='" + mLicense + '\'' +
                ", Color='" + mColor + '\'' +
                ", Year=" + mYear +
                ", Owner='" + mOwnerName + '\'' +
                ", Insurance='" + mInsuranceNumber + '\'' +
                ", EngineType='" + mEngineType + '\'';
    }
}
