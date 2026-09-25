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
