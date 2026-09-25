#import "../include/settings.typ": *

#show: apply-gost

= Задачи к выполнению

== Часть 1

Рассмотрим геометрические фигуры. Общий класс `GeometricObject`
используется для моделирования всех геометрических фигур: он содержит
свойства цвета `color` и заливки `filled`, а также соответствующие им
getter- и setter-методы, свойство `dateCreated` и методы
`getDateCreated()` и `toString()`. Метод `toString()` возвращает строковое
представление объекта. Классы `Circle` и `Rectangle` порождены от класса
`GeometricObject` и наследуют его методы через ключевое слово `extends`.

=== Задача 1

Создайте класс `Triangle` для представления треугольников, который
порождается от класса `GeometricObject`. Напишите клиент этих классов —
программу, которая запрашивает у пользователя ввести три стороны
треугольника, цвет и логическое значение для указания закрашен ли
треугольник. Программа должна создавать объект типа `Triangle` с
указанными сторонами и присваивать значения свойствам цвет `color` и
заливка `isFilled` с помощью этих входных данных. Программа должна
отображать площадь `area`, периметр `perimeter`, цвет, а также `true` или
`false` для указания, закрашен треугольник или нет.

Класс `Triangle` должен содержать:
- Три поля данных типа `double` с именами `side1`, `side2` и `side3` и с
  заданными по умолчанию значениями, равными 1.0, для обозначения трёх
  сторон треугольника.
- Безаргументный конструктор, который создаёт треугольник с заданными по
  умолчанию значениями.
- Конструктор, который создаёт треугольник с `side1`, `side2` и `side3`.
- Getter-методы для всех трёх полей данных.
- Метод с именем `getArea()`, который возвращает площадь этого
  треугольника (по формуле Герона).
- Метод с именем `getPerimeter()`, который возвращает периметр этого
  треугольника.
- Метод с именем `toString()`, который возвращает строковое описание
  треугольника.

=== Задача 2

В треугольнике сумма длин любых двух сторон больше длины третьей стороны.
Класс `Triangle` должен удовлетворять этому правилу. Создайте класс
`IllegalTriangleException` и измените конструктор класса `Triangle`, чтобы
выбросить объект типа `IllegalTriangleException`, если треугольник создан
со сторонами, нарушающими это правило.

=== Задача 3

Спроектируйте новый класс `Triangle`, который наследуется от абстрактного
класса `GeometricObject`.

1. Напишите тестовую программу, которая запрашивает у пользователя ввод
   трёх сторон треугольника, цвета и логического значения для указания
   заливки.
2. Программа должна создать объект типа `Triangle` с этими сторонами и
   задать свойства `color` и `filled`, используя введённые пользователем
   данные.
3. Программа должна отображать площадь, периметр, цвет и значение `true`
   или `false` для указания заливки.
4. Реализуйте в классе `GeometricObject` интерфейс `Comparable` и
   определите статический метод `max()` в классе `GeometricObject` для
   поиска наибольшего из двух объектов типа `GeometricObject`.
5. Проверьте тестовой программой работу метода `max()` для поиска
   наибольшего из двух кругов и наибольшего из двух прямоугольников.
6. Вернитесь к классу с именем `ComparableCircle`, который наследуется от
   `Circle` и реализует `Comparable`. Напишите тестовую программу, чтобы
   найти наибольший из двух экземпляров класса `ComparableCircle` и
   наибольший между кругом и прямоугольником, используя метод
   `compareTo()`.

=== Задача 4

1. Создайте интерфейс с именем `Colorable` с помощью метода
   `howToColor()` типа `void`. Каждый класс раскрашиваемого объекта
   должен реализовывать интерфейс `Colorable`.
2. Спроектируйте класс `Square`, который наследуется от `GeometricObject`
   и реализует `Colorable`. Реализуйте метод `howToColor()` для
   отображения сообщения: Раскрасьте все четыре стороны.
3. Класс `Square` содержит поле данных `side` с getter- и setter-методами,
   а также конструктор для создания `Square` с указанной стороной. У
   класса `Square` есть скрытое поле данных типа `double` с именем `side`
   и getter- и setter-методами. У него есть безаргументный конструктор,
   который создаёт объект типа `Square` со стороной, равной 0, и ещё один
   конструктор, который создаёт объект типа `Square` с указанной стороной.
4. Напишите тестовую программу, которая создаёт массив из пяти объектов
   типа `GeometricObject`. Для каждого объекта в массиве отобразите его
   площадь и вызовите метод `howToColor()`, если его можно раскрасить.

==== Решение
```java
// geometry/GeometricObject.java
package ru.haykor.mirea.geometry;

public abstract class GeometricObject implements Comparable<GeometricObject> {
    private String color = "white";
    private boolean filled;
    private final java.util.Date dateCreated;

    protected GeometricObject() {
        dateCreated = new java.util.Date();
    }

    protected GeometricObject(String color, boolean filled) {
        dateCreated = new java.util.Date();
        this.color = color;
        this.filled = filled;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public boolean isFilled() {
        return filled;
    }

    public void setFilled(boolean filled) {
        this.filled = filled;
    }

    public java.util.Date getDateCreated() {
        return dateCreated;
    }

    public abstract double getArea();

    @Override
    public int compareTo(GeometricObject o) {
        return Double.compare(getArea(), o.getArea());
    }

    public static GeometricObject max(GeometricObject o1, GeometricObject o2) {
        return (o1.compareTo(o2) >= 0) ? o1 : o2;
    }

    @Override
    public String toString() {
        return "created on " + dateCreated + "\ncolor: " + color + " and filled: " + filled;
    }
}
```

```java
// geometry/Circle.java
package ru.haykor.mirea.geometry;

public class Circle extends GeometricObject {
    private double radius;

    public Circle() {
    }

    public Circle(double radius) {
        this.radius = radius;
    }

    public Circle(double radius, String color, boolean filled) {
        super(color, filled);
        this.radius = radius;
    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public double getDiameter() {
        return 2 * radius;
    }

    public double getPerimeter() {
        return 2 * radius * Math.PI;
    }

    @Override
    public double getArea() {
        return radius * radius * Math.PI;
    }

    public void printCircle() {
        System.out.println("The circle is created " + getDateCreated() + " and the radius is " + radius);
    }
}
```

```java
// geometry/Rectangle.java
package ru.haykor.mirea.geometry;

public class Rectangle extends GeometricObject {
    private double width;
    private double height;

    public Rectangle() {
    }

    public Rectangle(double width, double height) {
        this.width = width;
        this.height = height;
    }

    public Rectangle(double width, double height, String color, boolean filled) {
        super(color, filled);
        this.width = width;
        this.height = height;
    }

    public double getWidth() {
        return width;
    }

    public void setWidth(double width) {
        this.width = width;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getPerimeter() {
        return 2 * (width + height);
    }

    @Override
    public double getArea() {
        return width * height;
    }
}
```

```java
// geometry/IllegalTriangleException.java
package ru.haykor.mirea.geometry;

public class IllegalTriangleException extends Exception {
    public IllegalTriangleException(String message) {
        super(message);
    }
}
```

```java
// geometry/Triangle.java
package ru.haykor.mirea.geometry;

public class Triangle extends GeometricObject {
    private double side1 = 1.0;
    private double side2 = 1.0;
    private double side3 = 1.0;

    public Triangle() {
    }

    public Triangle(double side1, double side2, double side3) throws IllegalTriangleException {
        if (side1 + side2 <= side3 || side1 + side3 <= side2 || side2 + side3 <= side1) {
            throw new IllegalTriangleException(
                    "Сумма длин любых двух сторон должна быть больше длины третьей стороны");
        }

        this.side1 = side1;
        this.side2 = side2;
        this.side3 = side3;
    }

    public double getSide1() {
        return side1;
    }

    public double getSide2() {
        return side2;
    }

    public double getSide3() {
        return side3;
    }

    public double getPerimeter() {
        return side1 + side2 + side3;
    }

    @Override
    public double getArea() {
        double s = (side1 + side2 + side3) / 2;
        return Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
    }

    @Override
    public String toString() {
        return "Треугольник: сторона1 = " + side1 + " сторона2 = " + side2 + " сторона3 = " + side3;
    }
}
```

```java
// app/TestTriangle.java
package ru.haykor.mirea.app;

import java.util.Scanner;

import ru.haykor.mirea.geometry.IllegalTriangleException;
import ru.haykor.mirea.geometry.Triangle;

public class TestTriangle {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Введите три стороны треугольника: ");
        double side1 = scanner.nextDouble();
        double side2 = scanner.nextDouble();
        double side3 = scanner.nextDouble();

        System.out.print("Введите цвет: ");
        String color = scanner.next();

        System.out.print("Треугольник закрашен? (true/false): ");
        boolean filled = scanner.nextBoolean();

        try {
            Triangle triangle = new Triangle(side1, side2, side3);
            triangle.setColor(color);
            triangle.setFilled(filled);

            System.out.println(triangle);
            System.out.println("Площадь: " + triangle.getArea());
            System.out.println("Периметр: " + triangle.getPerimeter());
            System.out.println("Цвет: " + triangle.getColor());
            System.out.println("Закрашен: " + triangle.isFilled());
        } catch (IllegalTriangleException e) {
            System.out.println("Ошибка: " + e.getMessage());
        }

        scanner.close();
    }
}
```

```java
// geometry/ComparableCircle.java
package ru.haykor.mirea.geometry;

public class ComparableCircle extends Circle {

    public ComparableCircle(double radius) {
        super(radius);
    }

    @Override
    public int compareTo(GeometricObject o) {
        Circle other = (Circle) o;
        return Double.compare(getRadius(), other.getRadius());
    }
}
```

`ComparableCircle` наследует реализацию `Comparable<GeometricObject>` от
`GeometricObject` (повторно реализовать интерфейс с другим параметром
типа в Java нельзя), поэтому вместо этого переопределяется сам метод
`compareTo()`, чтобы сравнивать круги по радиусу, а не по площади, как это
делает родительский класс.

```java
// app/TestMax.java
package ru.haykor.mirea.app;

import ru.haykor.mirea.geometry.Circle;
import ru.haykor.mirea.geometry.ComparableCircle;
import ru.haykor.mirea.geometry.GeometricObject;
import ru.haykor.mirea.geometry.Rectangle;

public class TestMax {
    public static void main(String[] args) {
        Circle circle1 = new Circle(4);
        Circle circle2 = new Circle(5);
        GeometricObject maxCircle = GeometricObject.max(circle1, circle2);
        System.out.println("Наибольший круг имеет площадь " + maxCircle.getArea());

        Rectangle rectangle1 = new Rectangle(2, 3);
        Rectangle rectangle2 = new Rectangle(4, 1);
        GeometricObject maxRectangle = GeometricObject.max(rectangle1, rectangle2);
        System.out.println("Наибольший прямоугольник имеет площадь " + maxRectangle.getArea());

        ComparableCircle comparableCircle1 = new ComparableCircle(4);
        ComparableCircle comparableCircle2 = new ComparableCircle(5);
        ComparableCircle maxComparableCircle =
                comparableCircle1.compareTo(comparableCircle2) >= 0 ? comparableCircle1 : comparableCircle2;
        System.out.println("Наибольший ComparableCircle имеет радиус " + maxComparableCircle.getRadius());

        GeometricObject maxBetweenCircleAndRectangle = GeometricObject.max(circle1, rectangle1);
        System.out.println("Наибольший между кругом и прямоугольником имеет площадь "
                + maxBetweenCircleAndRectangle.getArea());
    }
}
```

```java
// geometry/Colorable.java
package ru.haykor.mirea.geometry;

public interface Colorable {
    void howToColor();
}
```

```java
// geometry/Square.java
package ru.haykor.mirea.geometry;

public class Square extends GeometricObject implements Colorable {
    private double side;

    public Square() {
    }

    public Square(double side) {
        this.side = side;
    }

    public double getSide() {
        return side;
    }

    public void setSide(double side) {
        this.side = side;
    }

    @Override
    public double getArea() {
        return side * side;
    }

    @Override
    public void howToColor() {
        System.out.println("Раскрасьте все четыре стороны");
    }
}
```

```java
// app/TestColorable.java
package ru.haykor.mirea.app;

import ru.haykor.mirea.geometry.Circle;
import ru.haykor.mirea.geometry.Colorable;
import ru.haykor.mirea.geometry.GeometricObject;
import ru.haykor.mirea.geometry.Rectangle;
import ru.haykor.mirea.geometry.Square;

public class TestColorable {
    public static void main(String[] args) {
        GeometricObject[] objects = {
                new Circle(3),
                new Rectangle(2, 5),
                new Square(4),
                new Square(2.5),
                new Circle(1.5)
        };

        for (GeometricObject object : objects) {
            System.out.println("Площадь: " + object.getArea());

            if (object instanceof Colorable colorable) {
                colorable.howToColor();
            }
        }
    }
}
```

== Часть 2

Обработка исключений в Java позволяет поддерживать нормальный поток
работы приложения при возникновении ошибок времени выполнения.
`RuntimeException`, `Error` и их подклассы называются непроверяемыми
(unchecked) исключениями и не требуют обязательной обработки, тогда как
`ArrayIndexOutOfBoundsException` — непроверяемое исключение, которое
удобно использовать для отбраковки недопустимого пользовательского
ввода без явной валидации границ массива.

=== Задача 1

С помощью двух массивов напишите программу, которая предложит
пользователю ввести целое число от 1 до 12, а затем отобразит месяц и
количество дней, соответствующие этому целому числу. Если пользователь
вводит недопустимое число, то программа должна отображать «Недопустимое
число» с помощью перехвата `ArrayIndexOutOfBoundsException`. Программа
должна быть реализована таким образом, чтобы предотвратить ввод
пользователем любого числа, кроме целого.

```java
String[] months = {"январь", "февраль", "март", "апрель", "май",
    "июнь", "июль", "август", "сентябрь", "октябрь", "ноябрь", "декабрь"};
int[] dom = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
```

==== Решение
```java
// app/MonthDays.java
package ru.haykor.mirea.app;

import java.util.InputMismatchException;
import java.util.Scanner;

public class MonthDays {
    public static void main(String[] args) {
        String[] months = {"январь", "февраль", "март", "апрель", "май",
                "июнь", "июль", "август", "сентябрь", "октябрь", "ноябрь", "декабрь"};
        int[] dom = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

        Scanner scanner = new Scanner(System.in);

        try {
            System.out.print("Введите номер месяца (1-12): ");
            int month = scanner.nextInt();

            System.out.println("Месяц: " + months[month - 1] + ", количество дней: " + dom[month - 1]);
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("Недопустимое число");
        } catch (InputMismatchException e) {
            System.out.println("Нужно ввести целое число");
        }

        scanner.close();
    }
}
```

=== Задача 2

Дополните код 1 задания данной практической работы таким образом, чтобы
при выборе февраля была возможность записать год. Добавьте в программу
метод для расчёта является ли год високосным и измените вывод для
количества дней в феврале.

==== Решение
```java
// app/MonthDaysLeapYear.java
package ru.haykor.mirea.app;

import java.util.InputMismatchException;
import java.util.Scanner;

public class MonthDaysLeapYear {
    public static void main(String[] args) {
        String[] months = {"январь", "февраль", "март", "апрель", "май",
                "июнь", "июль", "август", "сентябрь", "октябрь", "ноябрь", "декабрь"};
        int[] dom = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

        Scanner scanner = new Scanner(System.in);

        try {
            System.out.print("Введите номер месяца (1-12): ");
            int month = scanner.nextInt();

            System.out.print("Введите год: ");
            int year = scanner.nextInt();

            int days = dom[month - 1];
            if (month == 2 && isLeapYear(year)) {
                days = 29;
            }

            System.out.println("Месяц: " + months[month - 1] + ", количество дней: " + days);
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("Недопустимое число");
        } catch (InputMismatchException e) {
            System.out.println("Нужно ввести целое число");
        }

        scanner.close();
    }

    private static boolean isLeapYear(int year) {
        return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
    }
}
```
