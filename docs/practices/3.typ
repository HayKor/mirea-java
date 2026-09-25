#import "../include/settings.typ": *

#show: apply-gost

= Задачи к выполнению

== Часть 1

=== Задача 1

Ваша программа должна быть организована по пакетам:
- Пакет `vehicles` для классов `Vehicle`, `Car`, `ElectricCar`, и интерфейса `ElectricVehicle`.
- Пакет `app` для тестового класса `TestCar`.

Создайте абстрактный класс `Vehicle`, который будет представлять общие
характеристики любого транспортного средства. Включите следующие поля:
`model`, `license`, `color`, `year`, `ownerName`, `insuranceNumber`,
`engineType`. Определите методы: геттеры и сеттеры для каждого поля, а
также метод `toString()`, который возвращает строку с описанием
транспортного средства. Добавьте абстрактный метод `vehicleType()`,
который будет возвращать тип транспортного средства (например, "Car",
"Electric Car"). Класс `Car` должен наследовать абстрактный класс
`Vehicle`. В конструкторе задавайте тип двигателя как "Combustion".
Реализуйте метод `vehicleType()`, который возвращает "Car".

Определите интерфейс `ElectricVehicle`, который будет описывать
специфические методы для электромобилей. В интерфейсе должны быть
следующие методы: `getBatteryCapacity()` и `setBatteryCapacity()`. Класс
`ElectricCar` должен наследовать класс `Car` и реализовывать интерфейс
`ElectricVehicle`. Реализуйте методы интерфейса и добавьте поле
`batteryCapacity` для хранения информации о ёмкости батареи. В
конструкторе задайте тип двигателя как "Electric".

Требования к тестированию программы:
- Созданы экземпляры классов `Car` и `ElectricCar`.
- Изменение года выпуска и имени владельца.
- Изменение страхового номера.
- Получение информации о ёмкости батареи у электромобиля.
- Вывод информации о транспортных средствах в консоль с помощью метода `toString()`.

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

    public Car() {
        super();
        mEngineType = "Combustion";
    }

    public Car(String model, String license, String color, int year,
               String ownerName, String insuranceNumber) {
        super(model, license, color, year, ownerName, insuranceNumber, "Combustion");
    }

    @Override
    public String vehicleType() {
        return "Car";
    }

    @Override
    public String toString() {
        return "Car{" + super.toString() + "}";
    }
}
```

```java
// vehicles/ElectricVehicle.java
package ru.haykor.mirea.vehicles;

public interface ElectricVehicle {
    double getBatteryCapacity();

    void setBatteryCapacity(double batteryCapacity);
}
```

```java
// vehicles/ElectricCar.java
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
```

```java
// app/TestCar.java
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
```

== Часть 2

=== Задача 1

Проектирование интерфейсов в классах Java. За основу взят проект
`bikeproject`, состоящий из классов `Bike`, `MountainBike`, `RoadBike` и
драйвера `BikeDriver`.

==== Ответы на вопросы

- *Приведите пример примитивного типа данных, который используется для хранения полей в классе.* Поле `numGears` в классе `Bike` и поле `frameSize` в классе `MountainBike` имеют тип `int`.
- *Приведите пример того, где происходит конкатенация строк.* В методе `Bike.printDescription()` при построении строки описания: `MAKE + "\n" + "This bike has " + handleBars`.
- *Каковы имена объектов, созданных в этой программе?* В классе `BikeDriver` созданы объекты `bike1`, `bike2`, `bike3`, `bike4`.
- *Сколько конструкторов у каждого класса?* `Bike` — 2 конструктора; `MountainBike` — 2 конструктора; `RoadBike` — 3 конструктора; `BikeDriver` — явных конструкторов нет (используется конструктор по умолчанию).
- *Определите супер- и подклассы из этой программы.* Суперкласс — `Bike`. Подклассы — `MountainBike` и `RoadBike`, оба наследуют `Bike`.
- *Значения полей стандартных (созданных по умолчанию) велосипедов каждого типа* приведены в @default-bikes-table.

#figure(
  table(
    columns: 3,
    align: (left, left, left),
    [*Поле*], [*MountainBike (по умолчанию)*], [*RoadBike (по умолчанию)*],
    [handleBars], [Bull Horn], [drop],
    [frame], [Hardtail], [racing],
    [tyres], [Maxxis], [tread less],
    [seatType], [dropper], [razor],
    [numGears], [27], [19],
    [suspension], [RockShox XC32], [—],
    [type], [Pro], [—],
    [frameSize], [19], [—],
    [tyreWidth], [—], [20],
    [postHeight], [—], [22],
  ),
  caption: [Значения полей стандартных велосипедов по умолчанию],
) <default-bikes-table>

==== Модернизация программы

1. Создайте интерфейс в проекте велосипеда, который устанавливает название
   компании-производителя велосипедов как неизменяемое значение. Он также
   определяет методы, которые должны быть реализованы любым классом,
   использующим интерфейс.
2. Создайте интерфейс с именем `MountainParts`, который имеет константу с
   именем `TERRAIN`, которая будет хранить строковое значение «off\_road».
   Интерфейс определит два метода, которые принимают аргумент с именем
   `newValue`, и два метода, которые будут возвращать текущее значение поля
   экземпляра. Методы должны быть названы: `getSuspension`, `setSuspension`,
   `getType`, `setType`.
3. Создайте интерфейс `RoadParts`, который имеет константу с именем
   `terrain`, которая будет хранить строковое значение «track\_racing».
   Интерфейс определит два метода, которые принимают аргумент с именем
   `newValue`, и два метода, которые будут возвращать текущее значение поля
   экземпляра. Методы должны быть названы: `getTyreWidth`, `setTyreWidth`,
   `getPostHeight`, `setPostHeight`.
4. Используйте интерфейс `BikeParts` с классом `Bike`, добавляя любые
   необходимые нереализованные методы. Добавьте требуемый внутренний код
   для каждого из добавленных методов.
5. Используйте интерфейс `MountainParts` с классом `MountainBike`, добавив
   все необходимые нереализованные методы. Добавьте требуемый внутренний
   код для каждого из добавленных методов.
6. Используйте интерфейс `RoadParts` с классом `RoadBike`, добавив все
   необходимые нереализованные методы. Добавьте требуемый внутренний код
   для каждого из добавленных методов.
7. Запустите и протестируйте свою программу, она должна работать точно так
   же, как и раньше.
8. В нижней части класса драйвера обновите высоту столба для `bike1` до 20
   вместо 22.
9. Выведите значения `bike1` на экран, чтобы подтвердить изменение.
10. Запустите и протестируйте свою программу.

==== Решение
```java
// bikeproject/BikeParts.java
package ru.haykor.mirea.bikeproject;

public interface BikeParts {
    String MAKE = "Oracle Cycles";

    void printDescription();
}
```

```java
// bikeproject/MountainParts.java
package ru.haykor.mirea.bikeproject;

public interface MountainParts {
    String TERRAIN = "off_road";

    void setSuspension(String newValue);

    void setType(String newValue);

    String getSuspension();

    String getType();
}
```

```java
// bikeproject/RoadParts.java
package ru.haykor.mirea.bikeproject;

public interface RoadParts {
    String terrain = "track_racing";

    void setTyreWidth(int newValue);

    void setPostHeight(int newValue);

    int getTyreWidth();

    int getPostHeight();
}
```

```java
// bikeproject/Bike.java
package ru.haykor.mirea.bikeproject;

public class Bike implements BikeParts {

    private String handleBars, frame, tyres, seatType;
    private int numGears;

    public Bike() {
    }

    public Bike(String handleBars, String frame, String tyres, String seatType, int numGears) {
        this.handleBars = handleBars;
        this.frame = frame;
        this.tyres = tyres;
        this.seatType = seatType;
        this.numGears = numGears;
    }

    @Override
    public void printDescription() {
        System.out.println("\n" + MAKE + "\n"
                + "This bike has " + this.handleBars + " handlebars on a "
                + this.frame + " frame with " + this.numGears + " gears."
                + "\nIt has a " + this.seatType + " seat with " + this.tyres + " tyres.");
    }
}
```

```java
// bikeproject/MountainBike.java
package ru.haykor.mirea.bikeproject;

public class MountainBike extends Bike implements MountainParts {

    private String suspension, type;
    private int frameSize;

    public MountainBike() {
        this("Bull Horn", "Hardtail", "Maxxis", "dropper", 27, "RockShox XC32", "Pro", 19);
    }

    public MountainBike(String handleBars, String frame, String tyres, String seatType, int numGears,
                         String suspension, String type, int frameSize) {
        super(handleBars, frame, tyres, seatType, numGears);
        this.suspension = suspension;
        this.type = type;
        this.frameSize = frameSize;
    }

    @Override
    public void printDescription() {
        super.printDescription();
        System.out.println("This mountain bike is a " + this.type + " bike and has a "
                + this.suspension + " suspension and a frame size of " + this.frameSize + " inches.");
    }

    @Override
    public void setSuspension(String newValue) {
        this.suspension = newValue;
    }

    @Override
    public String getSuspension() {
        return this.suspension;
    }

    @Override
    public void setType(String newValue) {
        this.type = newValue;
    }

    @Override
    public String getType() {
        return this.type;
    }
}
```

```java
// bikeproject/RoadBike.java
package ru.haykor.mirea.bikeproject;

public class RoadBike extends Bike implements RoadParts {

    private int tyreWidth, postHeight;

    public RoadBike() {
        this("drop", "racing", "tread less", "razor", 19, 20, 22);
    }

    public RoadBike(int postHeight) {
        this("drop", "racing", "tread less", "razor", 19, 20, postHeight);
    }

    public RoadBike(String handleBars, String frame, String tyres, String seatType, int numGears,
                     int tyreWidth, int postHeight) {
        super(handleBars, frame, tyres, seatType, numGears);
        this.tyreWidth = tyreWidth;
        this.postHeight = postHeight;
    }

    @Override
    public void printDescription() {
        super.printDescription();
        System.out.println("This Roadbike bike has " + this.tyreWidth + "mm tyres and a post height of " + this.postHeight + ".");
    }

    @Override
    public void setTyreWidth(int newValue) {
        this.tyreWidth = newValue;
    }

    @Override
    public int getTyreWidth() {
        return this.tyreWidth;
    }

    @Override
    public void setPostHeight(int newValue) {
        this.postHeight = newValue;
    }

    @Override
    public int getPostHeight() {
        return this.postHeight;
    }
}
```

```java
// bikeproject/BikeDriver.java
package ru.haykor.mirea.bikeproject;

public class BikeDriver {

    public static void main(String[] args) {

        RoadBike bike1 = new RoadBike();
        RoadBike bike2 = new RoadBike("drop", "tourer", "semi-grip", "comfort", 14, 25, 18);
        MountainBike bike3 = new MountainBike();
        Bike bike4 = new Bike();

        bike1.printDescription();
        bike2.printDescription();
        bike3.printDescription();
        bike4.printDescription();

        bike1.setPostHeight(20);
        bike1.printDescription();
    }
}
```
