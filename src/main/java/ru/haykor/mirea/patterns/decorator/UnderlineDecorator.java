package ru.haykor.mirea.patterns.decorator;

public class UnderlineDecorator extends TextDecorator {
    public UnderlineDecorator(Text decoratedText) {
        super(decoratedText);
    }

    @Override
    public String display() {
        return "<u>" + decoratedText.display() + "</u>";
    }
}
