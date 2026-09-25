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
