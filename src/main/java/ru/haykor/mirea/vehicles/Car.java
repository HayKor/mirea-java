package ru.haykor.mirea.vehicles;

public class Car {
    private String mModel;
    private String mLicense;
    private String mColor;
    private int mYear;
    private String mOwnerName;
    private String mInsuranceNumber;
    protected String mEngineType;

    private static final int CURRENT_YEAR = 2026;

    public Car() {
    }

    public Car(String model, String license, String color, int year) {
        mModel = model;
        mLicense = license;
        mColor = color;
        mYear = year;
    }

    public Car(String model, int year) {
        mModel = model;
        mYear = year;
    }

    public Car(String model, String license, String color, int year,
               String ownerName, String insuranceNumber, String engineType) {
        mModel = model;
        mLicense = license;
        mColor = color;
        mYear = year;
        mOwnerName = ownerName;
        mInsuranceNumber = insuranceNumber;
        mEngineType = engineType;
    }

    @Override
    public String toString() {
        return "ru.haykor.mirea.Car{" +
                "mModel='" + mModel + '\'' +
                ", mLicense='" + mLicense + '\'' +
                ", mColor='" + mColor + '\'' +
                ", mYear=" + mYear +
                ", mOwnerName='" + mOwnerName + '\'' +
                ", mInsuranceNumber='" + mInsuranceNumber + '\'' +
                ", mEngineType='" + mEngineType + '\'' +
                '}';
    }

    public int getAge() {
        return CURRENT_YEAR - mYear;
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
}
