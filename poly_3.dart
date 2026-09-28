abstract class Vehicle {}

class Car extends Vehicle {
  void drive() => print('Car is driving on roads.');
}

class Airplane extends Vehicle {
  void fly() => print('Airplane is flying in the sky.');
}

void processVehicle(Vehicle vehicle) {
  // 1. Runtime type check using 'is'
  if (vehicle is Car) {
    // Dart automatically "smart casts" inside the if block,
    // but here is the explicit use of 'as' to fulfill the requirement:
    final car = vehicle as Car;
    car.drive();
  } else if (vehicle is Airplane) {
    // Explicitly cast to Airplane
    //(vehicle as Airplane).fly();
  }
}

void main() {
  Vehicle myCar = Car();
  Vehicle myPlane = Airplane();

  processVehicle(myCar);   // Output: Car is driving on roads.
  processVehicle(myPlane); // Output: Airplane is flying in the sky.

  // Dangerous cast demonstration:
  try {
    // This will fail at runtime because myCar is not an Airplane
    Airplane failedCast = myCar as Airplane;
    failedCast.fly();
  } catch (e) {
    print('Cast failed: $e'); // Output: Cast failed: TypeError: ...
  }
}