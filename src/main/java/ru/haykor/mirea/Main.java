import ru.haykor.mirea.vehicles.Car;
import ru.haykor.mirea.vehicles.ElectricCar;

void main() {
    var simpleCar = new Car();
    simpleCar.setModel("Toyota Camry");

    simpleCar.setOwnerName("Иван Иванов");
    simpleCar.setInsuranceNumber("INS-123456");
    simpleCar.setEngineType("Gasoline");

    var tesla = new ElectricCar(
            "Tesla Model S",
            "E777EE77",
            "Красный",
            2023,
            "Алексей Смирнов",
            "INS-999888",
            100.0
    );

    IO.println("=== Обычный автомобиль ===");
    IO.println("Модель: " + simpleCar.getModel());
    IO.println("Владелец: " + simpleCar.getOwnerName());
    IO.println("Номер страховки: " + simpleCar.getInsuranceNumber());
    IO.println("Тип двигателя: " + simpleCar.getEngineType());

    IO.println("\n=== Электромобиль ===");
    IO.println("Модель: " + tesla.getModel());
    IO.println("Владелец: " + tesla.getOwnerName());
    IO.println("Номер страховки: " + tesla.getInsuranceNumber());
    IO.println("Тип двигателя (унаследован): " + tesla.getEngineType());
    IO.println("Ёмкость батареи: " + tesla.getBatteryCapacity() + " кВт⋅ч");
}
