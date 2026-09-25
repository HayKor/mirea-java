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
