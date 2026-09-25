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
