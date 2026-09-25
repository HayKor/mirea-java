package ru.haykor.mirea.app;

import ru.haykor.mirea.generics.GenericArrayStack;

public class TestGenericStackArray {
    public static void main(String[] args) {
        GenericArrayStack<String> stack = new GenericArrayStack<>();

        for (String s : new String[]{"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k"}) {
            stack.push(s);
        }

        System.out.println(stack);

        while (!stack.isEmpty()) {
            System.out.print(stack.pop() + " ");
        }
        System.out.println();
    }
}
