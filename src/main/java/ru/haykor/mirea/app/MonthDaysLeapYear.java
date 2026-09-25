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
