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
