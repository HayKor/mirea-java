#import "../include/settings.typ": *

#show: apply-gost

= Задачи к выполнению

== Задача 1

=== Задача 1.1
Напишите программу, которая конвертирует сумму денег из китайских юаней
в российские рубли по курсу покупки 11.91.

Константы задачи:

```java
final double ROUBLES_PER_YUAN = 11.91; // курс покупки
```

Входные данные задачи:

```java
int yuan; // сумма денег в китайских юанях
```

Выходные данные задачи:

```java
double roubles; // сумма денег в российских рублях
```

Соответствующие формулы:

```java
roubles = ROUBLES_PER_YUAN * yuan;
```
==== Алгоритм
1. Получить сумму денег в китайских юанях.
2. Конвертировать сумму денег в российские рубли.
   2.1. Выполнить вычисление:
   ```java
   roubles = ROUBLES_PER_YUAN * yuan;
   ```
3. Отобразить сумму денег в российских рублях в пользу покупателя.

==== Решение
```java
// Main.java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        final double ROUBLES_PER_YUAN = 11.91;

        Scanner scanner = new Scanner(System.in);

        int yuan = scanner.nextInt();
        double roubles = ROUBLES_PER_YUAN * yuan;

        System.out.println("Сумма в рублях: " + roubles);

        scanner.close();
    }
}
```

=== Задача 1.2 

Перепишите программу, которая конвертирует сумму денег из китайских
юаней в российские рубли по курсу покупки 11.91, добавив структуру
выбора для принятия решений об окончаниях входной валюты в зависимости
от ее значения.

Для того чтобы определить окончание, например, для китайских юаней
(китайский юань / китайских юаней / китайских юаня) в зависимости от их
суммы, необходимо вычислить последнюю цифру входной суммы.

Переменные программы:

```java
int digit; // последняя цифра dollars
```

Соответствующие формулы:

```java
digit = yuan % 10;
```

==== Решение
```java
// Main.java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        final double ROUBLES_PER_YUAN = 11.91;

        Scanner scanner = new Scanner(System.in);

        int yuan = scanner.nextInt();
        double roubles = ROUBLES_PER_YUAN * yuan;

        int digit = yuan % 10;
        String yuanWord;

        if (yuan % 100 >= 11 && yuan % 100 <= 14) {
            yuanWord = "юаней";
        } else if (digit == 1) {
            yuanWord = "юань";
        } else if (digit >= 2 && digit <= 4) {
            yuanWord = "юаня";
        } else {
            yuanWord = "юаней";
        }

        System.out.println(
            "Сумма: " + yuan + " " + yuanWord +
            " = " + roubles + " рублей"
        );

        scanner.close();
    }
}
```

== Задача 2
=== Задача 2.1

Напишите программу, в которой создается класс Car. В данном классе должны быть обозначены следующие поля: String model, String license, String color, int year – модель автомобиля, номер автомобиля, цвет автомобиля и год выпуска соответственно. Класс должен содержать три конструктора, один конструктор, который включает в себя все поля класса, один конструктор по умолчанию, один включает поля по выбору студента.

==== Решение
```java
// Car.java
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
```
=== Задача 2.2

В отдельном классе Main создайте экземпляры классов (объекты), используя различные конструкторы, реализованные в задаче #1. Создайте в классе метод To_String(), который будет выводить значения полей экземпляров класса. Проверьте работу созданного метода, вызвав его у объекта. Дополните класс методами для получения и установки значений для всех полей (геттерами и сеттерами). Создайте метод класса, который будет возвращать возраст автомобиля, вычисляющийся от текущего года, значение текущего года допускается сделаться константным.


==== Решение
```java
// Main.java
void main() {
    Car car1 = new Car();
    Car car2 = new Car("BMW 3 Series", "A123BC77", "Синий", 2018);
    Car car3 = new Car("Lada Vesta", 2021);

    car1.setModel("Audi A4");
    car1.setLicense("O001OO99");
    car1.setColor("Белый");
    car1.setYear(2015);

    IO.println("Cars info:");
    IO.println(car1);
    IO.println(car2);
    IO.println(car3);

    IO.println("\nРасчет возраста автомобилей:");
    IO.println("Возраст " + car1.getModel() + ": " + car1.getAge() + " лет");
    IO.println("Возраст " + car2.getModel() + ": " + car2.getAge() + " лет");
    IO.println("Возраст " + car3.getModel() + ": " + car3.getAge() + " лет");
}
```
