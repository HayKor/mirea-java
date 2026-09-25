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
