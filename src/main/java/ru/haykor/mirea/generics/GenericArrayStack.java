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
