package ru.haykor.mirea.patterns.builder;

public class Order {
    private String mainDish;
    private String sideDish;
    private String drink;
    private String dessert;

    void setMainDish(String mainDish) {
        this.mainDish = mainDish;
    }

    void setSideDish(String sideDish) {
        this.sideDish = sideDish;
    }

    void setDrink(String drink) {
        this.drink = drink;
    }

    void setDessert(String dessert) {
        this.dessert = dessert;
    }

    public String getMainDish() {
        return mainDish;
    }

    public String getSideDish() {
        return sideDish;
    }

    public String getDrink() {
        return drink;
    }

    public String getDessert() {
        return dessert;
    }

    @Override
    public String toString() {
        return "Order{mainDish='" + mainDish + "', sideDish='" + sideDish
                + "', drink='" + drink + "', dessert='" + dessert + "'}";
    }
}
