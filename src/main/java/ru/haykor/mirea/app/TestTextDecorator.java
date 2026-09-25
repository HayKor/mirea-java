package ru.haykor.mirea.app;

import ru.haykor.mirea.patterns.decorator.BoldDecorator;
import ru.haykor.mirea.patterns.decorator.ItalicDecorator;
import ru.haykor.mirea.patterns.decorator.PlainText;
import ru.haykor.mirea.patterns.decorator.Text;
import ru.haykor.mirea.patterns.decorator.UnderlineDecorator;

public class TestTextDecorator {
    public static void main(String[] args) {
        Text plain = new PlainText("Привет, мир!");
        System.out.println(plain.display());

        Text boldThenItalic = new ItalicDecorator(new BoldDecorator(plain));
        System.out.println(boldThenItalic.display());

        Text italicThenBold = new BoldDecorator(new ItalicDecorator(plain));
        System.out.println(italicThenBold.display());

        Text allThree = new UnderlineDecorator(new ItalicDecorator(new BoldDecorator(plain)));
        System.out.println(allThree.display());
    }
}
