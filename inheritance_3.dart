class Vehicle {
  final String brand;
  Vehicle(this.brand);
  void start() => print('$brand starting...');
  
  }


  class ElectricCar extends Vehicle {
    final int batteryCapacity;
    ElectricCar(super.brand, this.batteryCapacity) ;

    @override
    void start() {
      super.start();
      print('Battery level: $batteryCapacity kWh');
    }
  }