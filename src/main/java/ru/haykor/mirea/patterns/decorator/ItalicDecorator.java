package ru.haykor.mirea.patterns.decorator;

public class ItalicDecorator extends TextDecorator {
    public ItalicDecorator(Text decoratedText) {
        super(decoratedText);
    }

    @Override
    public String display() {
        return "<i>" + decoratedText.display() + "</i>";
    }
}
