void main() {
    Car car1 = new Car();
    Car car2 = new Car("BMW 3 Series", "A123BC77", "Синий", 2018);
    Car car3 = new Car("Lada Vesta", 2021);

    car1.setModel("Audi A4");
    car1.setLicense("O001OO99");
    car1.setColor("Белый");
    car1.setYear(2015);

    IO.println("Cars info:");
    IO.println(car1);
    IO.println(car2);
    IO.println(car3);

    IO.println("\nРасчет возраста автомобилей:");
    IO.println("Возраст " + car1.getModel() + ": " + car1.getAge() + " лет");
    IO.println("Возраст " + car2.getModel() + ": " + car2.getAge() + " лет");
    IO.println("Возраст " + car3.getModel() + ": " + car3.getAge() + " лет");
}
