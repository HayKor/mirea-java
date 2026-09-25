#import "../include/settings.typ": *

#show: apply-gost

= Задачи к выполнению

== Часть 1. Дженерики и обобщённое программирование

Дженерики (generics) позволяют обнаруживать ошибки уже во время
компиляции программы, а не во время её выполнения, и позволяют
параметризовать типы классов, интерфейсов и методов, начиная с JDK 1.5.

=== Задача 1

1. Напишите метод, которому передаётся коллекция объектов типа
   `ArrayList`, а возвращается коллекция `ArrayList`, но уже без
   дубликатов. Необходимо использовать метод `contains()` интерфейса
   `List`.
2. Реализуйте алгоритм линейного поиска элемента в массиве. При
   нахождении элемента необходимо вернуть его позицию в массиве. Если
   элемент не найден, то вернуть -1.
3. Реализуйте поиск наибольшего элемента в массиве с помощью метода
   `compareTo()` интерфейса `Comparable`. Определите класс `Circle` с
   полем `radius` и найдите наибольший элемент в массиве экземпляров
   этого класса.
4. Реализуйте поиск наибольшего элемента в двумерном массиве с помощью
   метода `compareTo()` интерфейса `Comparable`.

==== Решение
```java
// generics/Circle.java
package ru.haykor.mirea.generics;

public class Circle implements Comparable<Circle> {
    private double radius;

    public Circle(double radius) {
        this.radius = radius;
    }

    public double getRadius() {
        return radius;
    }

    @Override
    public int compareTo(Circle o) {
        return Double.compare(radius, o.radius);
    }

    @Override
    public String toString() {
        return "Circle{radius=" + radius + "}";
    }
}
```

```java
// generics/CollectionUtils.java
package ru.haykor.mirea.generics;

import java.util.ArrayList;

public class CollectionUtils {

    public static <E> ArrayList<E> withoutDuplicates(ArrayList<E> list) {
        ArrayList<E> result = new ArrayList<>();
        for (E element : list) {
            if (!result.contains(element)) {
                result.add(element);
            }
        }
        return result;
    }

    public static <E> int linearSearch(E[] array, E key) {
        for (int i = 0; i < array.length; i++) {
            if (array[i].equals(key)) {
                return i;
            }
        }
        return -1;
    }

    public static <E extends Comparable<E>> E findMax(E[] array) {
        E max = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i].compareTo(max) > 0) {
                max = array[i];
            }
        }
        return max;
    }

    public static <E extends Comparable<E>> E findMax(E[][] array) {
        E max = array[0][0];
        for (E[] row : array) {
            for (E element : row) {
                if (element.compareTo(max) > 0) {
                    max = element;
                }
            }
        }
        return max;
    }
}
```

```java
// app/TestGenericAlgorithms.java
package ru.haykor.mirea.app;

import java.util.ArrayList;
import java.util.List;

import ru.haykor.mirea.generics.Circle;
import ru.haykor.mirea.generics.CollectionUtils;

public class TestGenericAlgorithms {
    public static void main(String[] args) {
        ArrayList<Integer> numbers = new ArrayList<>(List.of(1, 2, 2, 3, 3, 3, 4));
        System.out.println("Без дубликатов: " + CollectionUtils.withoutDuplicates(numbers));

        Integer[] array = {5, 3, 9, 1, 7};
        System.out.println("Позиция 9: " + CollectionUtils.linearSearch(array, 9));
        System.out.println("Позиция 42: " + CollectionUtils.linearSearch(array, 42));

        Circle[] circles = {new Circle(2.0), new Circle(5.5), new Circle(3.1)};
        System.out.println("Наибольший круг: " + CollectionUtils.findMax(circles));

        Circle[][] circleGrid = {
                {new Circle(1.0), new Circle(4.0)},
                {new Circle(6.5), new Circle(2.0)}
        };
        System.out.println("Наибольший круг в матрице: " + CollectionUtils.findMax(circleGrid));
    }
}
```

== Часть 2. Обобщённый стек

Стек — это структура данных, которая содержит данные по принципу
«последним пришёл — первым обслужен» (LIFO). Для его моделирования
удобно определить обобщённый класс `GenericStack<E>`, реализованный с
помощью отношения композиции (поле-ссылка на `ArrayList<E>`):

```java
// generics/GenericStack.java (базовая реализация через композицию)
package ru.haykor.mirea.generics;

import java.util.ArrayList;

public class GenericStack<E> {
    private ArrayList<E> list = new ArrayList<>();

    public int getSize() {
        return list.size();
    }

    public E peek() {
        return list.get(getSize() - 1);
    }

    public void push(E o) {
        list.add(o);
    }

    public E pop() {
        E o = list.get(getSize() - 1);
        list.remove(getSize() - 1);
        return o;
    }

    public boolean isEmpty() {
        return list.isEmpty();
    }

    @Override
    public String toString() {
        return "стек: " + list.toString();
    }
}
```

=== Задача 2

1. Измените класс `GenericStack` таким образом, чтобы реализовать его с
   помощью массива, а не `ArrayList`. Перед добавлением нового элемента в
   стек необходимо проверить размер массива. Если массив заполнен,
   создайте новый массив, который удвоит текущий размер массива и
   скопирует элементы из текущего массива в новый.
2. Класс `GenericStack` из предыдущего описания реализован с помощью
   отношения композиции. Определите новый класс стека, который
   наследуется от `ArrayList`. Реализуйте новый класс `GenericStack`.
   Напишите тестовую программу, которая запросит у пользователя пять
   строк, а отобразит их в обратном порядке.

#figure(
  table(
    columns: 2,
    align: (left, left),
    [*Класс*], [*Отношение к `ArrayList<E>`*],
    [`GenericStack<E>`], [композиция (has-a) — хранит `ArrayList<E>` в приватном поле `list`],
    [`GenericArrayStack<E>`], [не зависит от `ArrayList` — хранит элементы в собственном массиве `E[]`],
    [`GenericStackByInheritance<E>`], [наследование (is-a) — расширяет `ArrayList<E>` и наследует все его методы],
  ),
  caption: [Отношения между вариантами обобщённого стека и `ArrayList<E>`],
) <generic-stack-relations>

Отношения между классами @generic-stack-relations: `GenericStack`
моделирует стек через композицию, поэтому у него нет лишних
унаследованных методов `ArrayList`; `GenericStackByInheritance`, наоборот,
наследует все публичные методы `ArrayList` (в том числе не относящиеся к
стеку, такие как `add(int, E)` или `remove(Object)`), что демонстрирует
недостаток моделирования стека через наследование.

==== Решение
```java
// generics/GenericArrayStack.java
package ru.haykor.mirea.generics;

import java.util.Arrays;

public class GenericArrayStack<E> {
    private E[] elements;
    private int size;

    @SuppressWarnings("unchecked")
    public GenericArrayStack() {
        elements = (E[]) new Object[10];
    }

    public int getSize() {
        return size;
    }

    public E peek() {
        return elements[size - 1];
    }

    public void push(E o) {
        if (size == elements.length) {
            elements = Arrays.copyOf(elements, elements.length * 2);
        }
        elements[size++] = o;
    }

    public E pop() {
        E o = elements[size - 1];
        elements[--size] = null;
        return o;
    }

    public boolean isEmpty() {
        return size == 0;
    }

    @Override
    public String toString() {
        return "стек: " + Arrays.toString(Arrays.copyOf(elements, size));
    }
}
```

```java
// generics/GenericStackByInheritance.java
package ru.haykor.mirea.generics;

import java.util.ArrayList;

public class GenericStackByInheritance<E> extends ArrayList<E> {

    public E peek() {
        return get(size() - 1);
    }

    public void push(E o) {
        add(o);
    }

    public E pop() {
        E o = get(size() - 1);
        remove(size() - 1);
        return o;
    }
}
```

```java
// app/TestGenericStackByInheritance.java
package ru.haykor.mirea.app;

import java.util.Scanner;

import ru.haykor.mirea.generics.GenericStackByInheritance;

public class TestGenericStackByInheritance {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        GenericStackByInheritance<String> stack = new GenericStackByInheritance<>();

        System.out.println("Введите пять строк:");
        for (int i = 0; i < 5; i++) {
            stack.push(scanner.nextLine());
        }

        System.out.println("В обратном порядке:");
        while (!stack.isEmpty()) {
            System.out.println(stack.pop());
        }

        scanner.close();
    }
}
```

== Часть 3. Клонирование объектов

Чтобы определить пользовательский класс, который реализует интерфейс
`Cloneable`, этот класс должен переопределить метод `clone()`,
определённый в классе `Object`. Метод `clone()` класса `Object`
выполняет только поверхностную копию: если поле объектного типа, то
копируется лишь ссылка на объект, а не его содержимое. Чтобы получить
глубокую копию, поле-ссылку необходимо клонировать отдельно внутри
переопределённого метода `clone()`.

=== Задача 1

1. Определите класс `MyStack` в соответствии со следующей таблицей:

#figure(
  table(
    columns: 2,
    align: (left, left),
    [*Метод / поле*], [*Описание*],
    [`-list: ArrayList`], [Список для хранения элементов],
    [`+isEmpty(): boolean`], [Возвращает `true`, если стек пуст],
    [`+getSize(): int`], [Возвращает количество элементов в стеке],
    [`+peek(): Object`], [Возвращает элемент на вершине стека, не удаляя его],
    [`+pop(): Object`], [Возвращает и удаляет элемент на вершине стека],
    [`+push(o: Object): void`], [Добавляет элемент в верхнюю часть стека],
  ),
  caption: [Спецификация класса `MyStack`],
) <mystack-spec>

   Класс `MyStack` реализован с помощью композиции (поле `list` типа
   `ArrayList`). Убедитесь, что класс `MyStack` реализован с помощью
   композиции. Определите новый класс `MyStack`, который наследуется от
   класса `ArrayList`. Реализуйте класс `MyStack`. Напишите клиент класса
   `MyStack` — программу, которая запрашивает у пользователя пять строк и
   отображает их в обратном порядке.
2. Перепишите класс `MyStack` для выполнения глубокой копии поля списка.

Отношение между классами аналогично отношению между `GenericStack` и
`ArrayList` из части 2: `MyStack` содержит `ArrayList` (композиция,
has-a), а `MyStackByInheritance` наследуется от `ArrayList`
(наследование, is-a). Оба класса используют «сырые» (raw) типы `ArrayList`
и `Object` — без параметризации, как указано в задании.

==== Решение
```java
// stack/MyStackByInheritance.java
package ru.haykor.mirea.stack;

import java.util.ArrayList;

public class MyStackByInheritance extends ArrayList {

    public Object peek() {
        return get(size() - 1);
    }

    public Object pop() {
        Object o = get(size() - 1);
        remove(size() - 1);
        return o;
    }

    public void push(Object o) {
        add(o);
    }
}
```

```java
// app/TestMyStack.java
package ru.haykor.mirea.app;

import java.util.Scanner;

import ru.haykor.mirea.stack.MyStackByInheritance;

public class TestMyStack {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        MyStackByInheritance stack = new MyStackByInheritance();

        System.out.println("Введите пять строк:");
        for (int i = 0; i < 5; i++) {
            stack.push(scanner.nextLine());
        }

        System.out.println("В обратном порядке:");
        while (!stack.isEmpty()) {
            System.out.println(stack.pop());
        }

        scanner.close();
    }
}
```

Итоговый класс `MyStack` (композиция), уже дополненный методом `clone()`
из задачи 2, выполняющим глубокую копию поля `list`:

```java
// stack/MyStack.java
package ru.haykor.mirea.stack;

import java.util.ArrayList;

public class MyStack implements Cloneable {
    private ArrayList list = new ArrayList();

    public boolean isEmpty() {
        return list.isEmpty();
    }

    public int getSize() {
        return list.size();
    }

    public Object peek() {
        return list.get(getSize() - 1);
    }

    public Object pop() {
        Object o = list.get(getSize() - 1);
        list.remove(getSize() - 1);
        return o;
    }

    public void push(Object o) {
        list.add(o);
    }

    @Override
    public Object clone() {
        try {
            MyStack cloned = (MyStack) super.clone();
            // Глубокая копия поля list, чтобы клон не делил хранилище с оригиналом
            cloned.list = (ArrayList) list.clone();
            return cloned;
        } catch (CloneNotSupportedException e) {
            return null;
        }
    }

    @Override
    public String toString() {
        return "стек: " + list.toString();
    }
}
```

```java
// app/TestMyStackClone.java
package ru.haykor.mirea.app;

import ru.haykor.mirea.stack.MyStack;

public class TestMyStackClone {
    public static void main(String[] args) {
        MyStack stack1 = new MyStack();
        stack1.push("a");
        stack1.push("b");
        stack1.push("c");

        MyStack stack2 = (MyStack) stack1.clone();
        stack2.push("d");

        System.out.println("stack1: " + stack1);
        System.out.println("stack2: " + stack2);
        System.out.println("Списки — разные объекты: " + (stack1 != stack2));
    }
}
```

Программа выводит `stack1: стек: [a, b, c]` и `stack2: стек: [a, b, c,
d]` — после клонирования у `stack2` появляется собственный список,
независимый от `list` объекта `stack1`, что подтверждает выполнение
глубокой копии поля `list` (без переопределения `clone()` оба стека
делили бы одну и ту же ссылку на `ArrayList`, и `push("d")` изменил бы оба
объекта одновременно).
