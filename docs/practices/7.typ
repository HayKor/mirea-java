#import "../include/settings.typ": *

#show: apply-gost

= Задачи к выполнению

== Часть 1. Структурные паттерны проектирования

Структурные паттерны (Structural Patterns) — это группа паттернов
проектирования, которая фокусируется на способах организации классов и
объектов в более крупные структуры. Они обеспечивают гибкость и
удобство взаимодействия между компонентами системы, способствуя
уменьшению связности и упрощению поддержки кода. К структурным
паттернам относятся Adapter, Bridge, Composite, Decorator, Facade,
Flyweight и Proxy.

=== Практическое задание — вариант №4 (Decorator)

Создать систему для расширения функционала базового текстового
редактора. Например, добавьте декораторы для форматирования текста
(жирный, курсив и подчёркнутый текст).

Требования:
- Реализовать интерфейс `Text` с методом `display()`.
- Создать базовый класс для простого текста и декораторы для добавления
  форматирования.
- Декораторы должны быть применимы в любом порядке.

Паттерн Decorator динамически добавляет объекту новые обязанности, не
изменяя его код: абстрактный класс `TextDecorator` сам реализует
`Text` и оборачивает другой объект `Text` (декорируемый или уже
декорированный ранее), делегируя ему вызов и добавляя собственное
форматирование поверх результата. Поскольку каждый конкретный
декоратор (`BoldDecorator`, `ItalicDecorator`, `UnderlineDecorator`)
одновременно является `Text` и принимает `Text` в конструкторе,
декораторы можно оборачивать друг в друга в любом порядке.

==== Решение
```java
// patterns/decorator/Text.java
package ru.haykor.mirea.patterns.decorator;

public interface Text {
    String display();
}
```

```java
// patterns/decorator/PlainText.java
package ru.haykor.mirea.patterns.decorator;

public class PlainText implements Text {
    private final String content;

    public PlainText(String content) {
        this.content = content;
    }

    @Override
    public String display() {
        return content;
    }
}
```

```java
// patterns/decorator/TextDecorator.java
package ru.haykor.mirea.patterns.decorator;

public abstract class TextDecorator implements Text {
    protected final Text decoratedText;

    protected TextDecorator(Text decoratedText) {
        this.decoratedText = decoratedText;
    }
}
```

```java
// patterns/decorator/BoldDecorator.java
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
```

```java
// patterns/decorator/ItalicDecorator.java
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
```

```java
// patterns/decorator/UnderlineDecorator.java
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
```

```java
// app/TestTextDecorator.java
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
```

Вывод программы показывает, что декораторы `BoldDecorator` и
`ItalicDecorator` дают разный, но корректный результат в зависимости от
порядка оборачивания (`<i><b>...</b></i>` против `<b><i>...</i></b>`), а
любое их количество можно комбинировать в цепочку:
```
Привет, мир!
<i><b>Привет, мир!</b></i>
<b><i>Привет, мир!</i></b>
<u><i><b>Привет, мир!</b></i></u>
```

== Часть 2. Поведенческие паттерны проектирования

Поведенческие паттерны (Behavioral Patterns) описывают способы
взаимодействия объектов и классов друг с другом, фокусируясь на
алгоритмах и распределении обязанностей. Они помогают обеспечить
эффективное и гибкое взаимодействие между компонентами системы,
упрощая коммуникацию и управление поведением объектов. К поведенческим
паттернам относятся Chain of Responsibility, Command, Iterator,
Mediator, Memento, Observer, State, Strategy, Template Method и
Visitor.

=== Практическое задание — вариант №4 (Mediator)

Реализовать систему чата, где несколько пользователей могут
обмениваться сообщениями через посредника.

Требования:
- Создать интерфейс `Mediator` для координации сообщений.
- Реализовать классы `User`, которые будут отправлять и получать
  сообщения через посредника.
- Продемонстрировать обмен сообщениями между пользователями.

Паттерн Mediator обеспечивает централизованное взаимодействие между
объектами, уменьшая их связанность: классы `User` не хранят ссылки друг
на друга и ничего не знают о том, сколько в чате других участников, —
они знают только об объекте `ChatMediator`, которому передают исходящие
сообщения и от которого получают входящие через обратный вызов
`receive()`.

==== Решение
```java
// patterns/mediator/ChatMediator.java
package ru.haykor.mirea.patterns.mediator;

public interface ChatMediator {
    void addUser(User user);

    void sendMessage(String message, User sender);
}
```

```java
// patterns/mediator/User.java
package ru.haykor.mirea.patterns.mediator;

public class User {
    private final String name;
    private final ChatMediator mediator;

    public User(String name, ChatMediator mediator) {
        this.name = name;
        this.mediator = mediator;
        mediator.addUser(this);
    }

    public String getName() {
        return name;
    }

    public void send(String message) {
        System.out.println(name + " отправляет: " + message);
        mediator.sendMessage(message, this);
    }

    public void receive(String message, String from) {
        System.out.println(name + " получил от " + from + ": " + message);
    }
}
```

```java
// patterns/mediator/ChatRoom.java
package ru.haykor.mirea.patterns.mediator;

import java.util.ArrayList;
import java.util.List;

public class ChatRoom implements ChatMediator {
    private final List<User> users = new ArrayList<>();

    @Override
    public void addUser(User user) {
        users.add(user);
    }

    @Override
    public void sendMessage(String message, User sender) {
        for (User user : users) {
            if (user != sender) {
                user.receive(message, sender.getName());
            }
        }
    }
}
```

```java
// app/TestChatMediator.java
package ru.haykor.mirea.app;

import ru.haykor.mirea.patterns.mediator.ChatMediator;
import ru.haykor.mirea.patterns.mediator.ChatRoom;
import ru.haykor.mirea.patterns.mediator.User;

public class TestChatMediator {
    public static void main(String[] args) {
        ChatMediator chatRoom = new ChatRoom();

        User alice = new User("Алиса", chatRoom);
        User bob = new User("Боб", chatRoom);
        User carol = new User("Кэрол", chatRoom);

        alice.send("Привет всем!");
        bob.send("Привет, Алиса!");
    }
}
```

Вывод программы показывает, что каждое сообщение, отправленное через
`send()`, посредник `ChatRoom` рассылает всем участникам чата, кроме
самого отправителя:
```
Алиса отправляет: Привет всем!
Боб получил от Алиса: Привет всем!
Кэрол получил от Алиса: Привет всем!
Боб отправляет: Привет, Алиса!
Алиса получил от Боб: Привет, Алиса!
Кэрол получил от Боб: Привет, Алиса!
```
