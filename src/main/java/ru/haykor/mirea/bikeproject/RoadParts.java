package ru.haykor.mirea.bikeproject;

public interface RoadParts {
    String terrain = "track_racing";

    void setTyreWidth(int newValue);

    void setPostHeight(int newValue);

    int getTyreWidth();

    int getPostHeight();
}
