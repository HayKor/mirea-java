#import "../include/settings.typ": *

#show: apply-gost

= Задачи к выполнению

== Часть 1. Абстрактные типы данных: очередь

Очереди обычно упорядочивают элементы по принципу FIFO («первым пришёл
— первым ушёл»): все новые элементы добавляются в конец очереди, а
первым удаляется методами `remove()`/`poll()` тот элемент, который был
добавлен раньше остальных.

=== Задача 1

Реализуйте стек (LIFO — «последний пришёл — первый ушёл»), используя не
более двух очередей (FIFO — «первый пришёл — первый ушёл») и только
стандартные методы очереди `add`/`offer`, `peek`, `poll`, `size`,
`isEmpty`. Для проектирования используйте отношение композиция.

В реализованном стеке должны поддерживаться методы `push`, `top`, `pop`,
`empty` и метод, возвращающий строковое представление всех элементов
стека.

Методы класса `StackOnQueue`:
- `void push(int x)` — помещает элемент `x` на вершину стека.
- `int pop()` — удаляет элемент на вершине стека и возвращает его.
- `int top()` — возвращает элемент на вершине стека.
- `boolean empty()` — возвращает `true`, если стек пуст, в ином случае
  `false`.

==== Решение

Идея реализации: два поля `queue1`/`queue2` типа `Queue<Integer>`
(отношение композиции). При каждом `push(x)` новый элемент добавляется в
пустую `queue2`, после чего в неё же переносятся все элементы из
`queue1`, и ссылки на очереди меняются местами. В результате голова
`queue1` всегда содержит последний добавленный элемент, что и даёт
поведение LIFO при использовании только операций FIFO-очереди.

```java
// queue/StackOnQueue.java
package ru.haykor.mirea.queue;

import java.util.LinkedList;
import java.util.Queue;

public class StackOnQueue {
    private Queue<Integer> queue1 = new LinkedList<>();
    private Queue<Integer> queue2 = new LinkedList<>();

    public void push(int x) {
        queue2.offer(x);
        while (!queue1.isEmpty()) {
            queue2.offer(queue1.poll());
        }

        Queue<Integer> temp = queue1;
        queue1 = queue2;
        queue2 = temp;
    }

    public int pop() {
        return queue1.poll();
    }

    public int top() {
        return queue1.peek();
    }

    public boolean empty() {
        return queue1.isEmpty();
    }

    @Override
    public String toString() {
        return "стек: " + queue1.toString();
    }
}
```

=== Задача 2

Создайте новый тестовый класс. Для проверки работы созданного стека
создайте в тестовом классе новый экземпляр класса `StackOnQueue`,
добавьте в этот стек два значения, выведите объект, находящийся на
вершине стека (без удаления), выведите объект, находящийся на вершине
стека и удалите его, проверьте стек на пустоту и выведите информацию о
всех элементах стека.

==== Решение
```java
// app/TestStackOnQueue.java
package ru.haykor.mirea.app;

import ru.haykor.mirea.queue.StackOnQueue;

public class TestStackOnQueue {
    public static void main(String[] args) {
        StackOnQueue stack = new StackOnQueue();

        stack.push(10);
        stack.push(20);

        System.out.println("Вершина стека: " + stack.top());
        System.out.println("Удалённый элемент: " + stack.pop());
        System.out.println("Стек пуст: " + stack.empty());

        stack.push(30);
        stack.push(40);
        System.out.println(stack);
    }
}
```

Вывод программы:
```
Вершина стека: 20
Удалённый элемент: 20
Стек пуст: false
стек: [40, 30, 10]
```

== Часть 2. Порождающие паттерны проектирования

Порождающие паттерны (Creational Patterns) — это группа паттернов
проектирования, которая фокусируется на процессе создания объектов: они
инкапсулируют логику создания объекта отдельно от его использования,
упрощают создание сложных объектов и позволяют менять способ создания
объектов, не затрагивая код, который эти объекты использует. К
порождающим паттернам относятся Singleton, Factory Method, Abstract
Factory, Builder и Prototype.

=== Практическое задание — вариант №4 (Builder)

Разработать систему для создания заказа в ресторане. Использовать
паттерн Builder для построения объекта `Order`, который включает
следующие параметры: основное блюдо, гарнир, напиток, десерт.

- Создать класс `Order` с соответствующими полями.
- Реализовать класс `OrderBuilder` для пошагового создания заказа.
- Продемонстрировать сборку заказов с разными конфигурациями.

Пример функционала: метод `setMainDish(String mainDish)` для выбора
основного блюда, метод `setDrink(String drink)` для выбора напитка,
метод `build()`, возвращающий готовый заказ.

Паттерн Builder разделяет процесс пошагового построения объекта
`Order` (класс `OrderBuilder`) от самого объекта-результата (класс
`Order`), позволяя собирать разные конфигурации заказа одним и тем же
кодом строителя — методы `OrderBuilder` возвращают `this`, поэтому
вызовы можно объединять в цепочку.

==== Решение
```java
// patterns/builder/Order.java
package ru.haykor.mirea.patterns.builder;

public class Order {
    private String mainDish;
    private String sideDish;
    private String drink;
    private String dessert;

    void setMainDish(String mainDish) {
        this.mainDish = mainDish;
    }

    void setSideDish(String sideDish) {
        this.sideDish = sideDish;
    }

    void setDrink(String drink) {
        this.drink = drink;
    }

    void setDessert(String dessert) {
        this.dessert = dessert;
    }

    public String getMainDish() {
        return mainDish;
    }

    public String getSideDish() {
        return sideDish;
    }

    public String getDrink() {
        return drink;
    }

    public String getDessert() {
        return dessert;
    }

    @Override
    public String toString() {
        return "Order{mainDish='" + mainDish + "', sideDish='" + sideDish
                + "', drink='" + drink + "', dessert='" + dessert + "'}";
    }
}
```

```java
// patterns/builder/OrderBuilder.java
package ru.haykor.mirea.patterns.builder;

public class OrderBuilder {
    private final Order order = new Order();

    public OrderBuilder setMainDish(String mainDish) {
        order.setMainDish(mainDish);
        return this;
    }

    public OrderBuilder setSideDish(String sideDish) {
        order.setSideDish(sideDish);
        return this;
    }

    public OrderBuilder setDrink(String drink) {
        order.setDrink(drink);
        return this;
    }

    public OrderBuilder setDessert(String dessert) {
        order.setDessert(dessert);
        return this;
    }

    public Order build() {
        return order;
    }
}
```

```java
// app/TestOrderBuilder.java
package ru.haykor.mirea.app;

import ru.haykor.mirea.patterns.builder.Order;
import ru.haykor.mirea.patterns.builder.OrderBuilder;

public class TestOrderBuilder {
    public static void main(String[] args) {
        Order lunch = new OrderBuilder()
                .setMainDish("Стейк")
                .setSideDish("Картофель фри")
                .setDrink("Апельсиновый сок")
                .setDessert("Тирамису")
                .build();

        Order quickOrder = new OrderBuilder()
                .setMainDish("Бургер")
                .setDrink("Кола")
                .build();

        System.out.println(lunch);
        System.out.println(quickOrder);
    }
}
```

Вывод программы демонстрирует две разные конфигурации заказа,
собранные одним и тем же строителем — полный обед `lunch` со всеми
четырьмя параметрами и укороченный `quickOrder` без гарнира и десерта:
```
Order{mainDish='Стейк', sideDish='Картофель фри', drink='Апельсиновый сок', dessert='Тирамису'}
Order{mainDish='Бургер', sideDish='null', drink='Кола', dessert='null'}
```
