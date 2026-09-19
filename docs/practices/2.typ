#import "../include/settings.typ": *

#show: apply-gost

= Задачи к выполнению
== Часть 1

=== Задача 1
Создайте пакет vehicles, который будет содержать классы Car и ElectricCar и
пакет app, в котором будет находиться основной класс с методом main.
Добавьте в класс Car приватные поля (private) ownerName и
insuranceNumber. Создайте методы доступа (геттеры и сеттеры) для полей
ownerName и insuranceNumber. Добавьте поле engineType с модификатором
доступа protected и создайте методы доступа к этому полю
==== Решение

```java
// vehicles/Car.java
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
```

=== Задача 2
Создайте новый класс ElectricCar, который наследует класс Car, и добавьте в
него поле batteryCapacity. В классе ElectricCar используйте поле engineType,
чтобы задать тип двигателя как "Electric". Проверьте работу инкапсуляции и
наследования, создав объекты классов Car и ElectricCar и продемонстрируйте
доступ к полям с разными модификаторами.


```java
// vehicles/Electric.car
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
```

== Часть 2

=== Задача 1
Ваша программа должна быть организована по пакетам:

- Пакет `vehicles` для классов `Vehicle`, `Car`, `ElectricCar`.
- Пакет `app` для тестового класса `TestCar`.

Используя программу, выполненную ранее, внести следующие изменения:

1. Добавить абстрактный класс `Vehicle`, который будет представлять общие
   свойства всех транспортных средств. В этот класс включите следующие общие
   поля для транспортных средств: `model` (модель); `license` (номерной знак);
   `color` (цвет); `year` (год выпуска); `ownerName` (имя владельца);
   `insuranceNumber` (страховой номер); `engineType` (тип двигателя, поле должно
   быть защищённым для наследования). Определите абстрактный метод
   `vehicleType()`, который будет возвращать тип транспортного средства.
   Добавьте методы для получения и изменения значений полей (геттеры и сеттеры).

- Изменить класс `Car`, чтобы он наследовал `Vehicle`. Реализуйте абстрактный
  метод `vehicleType()`, чтобы он возвращал `"Car"`. В конструкторе класса `Car`
  используйте поля и методы родительского класса.

- Изменить класс `ElectricCar`, чтобы он наследовал `Car`. Добавьте в класс поле
  `batteryCapacity` (ёмкость аккумулятора) и методы для работы с ним.
  Реализуйте метод `vehicleType()`, который будет возвращать `"Electric Car"`.
  Используйте `protected`-поле `engineType` для установки значения `"Electric"`
  в классе `ElectricCar`.

- Использовать полиморфизм в тестовом классе для работы с объектами `Car` и
  `ElectricCar` через ссылки на родительские классы. Создайте объекты `Car` и
  `ElectricCar`, измените их свойства с помощью сеттеров, и выведите информацию
  на экран с помощью метода `toString()`.

- Включить инкапсуляцию: убедитесь, что поля каждого класса имеют доступ через
  методы (геттеры и сеттеры), а не напрямую.

==== Решение

```java
// vehicles/Vehicle.java
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
```

```java
// vehicles/Car.java
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
```

```java
// vehicles/ElectricCar.java
package ru.haykor.mirea.vehicles;

public class ElectricCar extends Car {
    private double mBatteryCapacity;

    public ElectricCar() {
        super();
        mEngineType = "Electric";
    }

    public ElectricCar(String model, String license, String color, int year,
                       String ownerName, String insuranceNumber, double batteryCapacity) {
        super(model, license, color, year, ownerName, insuranceNumber, "Electric");
        mBatteryCapacity = batteryCapacity;
        mEngineType = "Electric";
    }

    @Override
    public String vehicleType() {
        return "Electric Car";
    }

    public double getBatteryCapacity() {
        return mBatteryCapacity;
    }

    public void setBatteryCapacity(double batteryCapacity) {
        mBatteryCapacity = batteryCapacity;
    }

    @Override
    public String toString() {
        return "ElectricCar{" + super.toString() +
                ", BatteryCapacity=" + mBatteryCapacity + " kWh}";
    }
}
```
