package ru.haykor.mirea.patterns.decorator;

public class BoldDecorator extends TextDecorator {
    public BoldDecorator(Text decoratedText) {
        super(decoratedText);
    }

    @Override
    public String display() {
        return "<b>" + decoratedText.display() + "</b>";
    }
}
