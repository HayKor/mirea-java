package ru.haykor.mirea.patterns.decorator;

public abstract class TextDecorator implements Text {
    protected final Text decoratedText;

    protected TextDecorator(Text decoratedText) {
        this.decoratedText = decoratedText;
    }
}
