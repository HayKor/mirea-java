package ru.haykor.mirea.bikeproject;

public class RoadBike extends Bike implements RoadParts {

    private int tyreWidth, postHeight;

    public RoadBike() {
        this("drop", "racing", "tread less", "razor", 19, 20, 22);
    }

    public RoadBike(int postHeight) {
        this("drop", "racing", "tread less", "razor", 19, 20, postHeight);
    }

    public RoadBike(String handleBars, String frame, String tyres, String seatType, int numGears,
                     int tyreWidth, int postHeight) {
        super(handleBars, frame, tyres, seatType, numGears);
        this.tyreWidth = tyreWidth;
        this.postHeight = postHeight;
    }

    @Override
    public void printDescription() {
        super.printDescription();
        System.out.println("This Roadbike bike has " + this.tyreWidth + "mm tyres and a post height of " + this.postHeight + ".");
    }

    @Override
    public void setTyreWidth(int newValue) {
        this.tyreWidth = newValue;
    }

    @Override
    public int getTyreWidth() {
        return this.tyreWidth;
    }

    @Override
    public void setPostHeight(int newValue) {
        this.postHeight = newValue;
    }

    @Override
    public int getPostHeight() {
        return this.postHeight;
    }
}
