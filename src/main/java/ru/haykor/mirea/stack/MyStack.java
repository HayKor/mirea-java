package ru.haykor.mirea.stack;

import java.util.ArrayList;

public class MyStack implements Cloneable {
    private ArrayList list = new ArrayList();

    public boolean isEmpty() {
        return list.isEmpty();
    }

    public int getSize() {
        return list.size();
    }

    public Object peek() {
        return list.get(getSize() - 1);
    }

    public Object pop() {
        Object o = list.get(getSize() - 1);
        list.remove(getSize() - 1);
        return o;
    }

    public void push(Object o) {
        list.add(o);
    }

    @Override
    public Object clone() {
        try {
            MyStack cloned = (MyStack) super.clone();
            // Глубокая копия поля list, чтобы клон не делил хранилище с оригиналом
            cloned.list = (ArrayList) list.clone();
            return cloned;
        } catch (CloneNotSupportedException e) {
            return null;
        }
    }

    @Override
    public String toString() {
        return "стек: " + list.toString();
    }
}
