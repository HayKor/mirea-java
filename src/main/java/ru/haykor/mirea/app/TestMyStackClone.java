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
