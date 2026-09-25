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
