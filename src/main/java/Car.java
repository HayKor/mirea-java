public class Car {
    private String mModel;
    private String mLicense;
    private String mColor;
    private int mYear;

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

    @Override
    public String toString() {
        return "Car{" +
                "mModel='" + mModel + '\'' +
                ", mLicense='" + mLicense + '\'' +
                ", mColor='" + mColor + '\'' +
                ", mYear=" + mYear +
                '}';
    }


    public int getAge() {
        return CURRENT_YEAR - mYear;
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