// 1. Define the mixins
mixin Walker {
  void walk() => print('Walking on two webbed feet.');
}

mixin Swimmer {
  void swim() => print('Paddling in the water.');
}

mixin Flyable {
  void fly() => print('Flapping wings and flying.');
}

// 2. Combine all mixins onto the Duck class
class Duck with Walker, Swimmer, Flyable {
  final String name;

  Duck(this.name);
}

void main() {
  final duck = Duck('Donald');

  print('--- ${duck.name} actions ---');
  duck.walk(); // Output: Walking on two webbed feet.
  duck.swim(); // Output: Paddling in the water.
  duck.fly();  // Output: Flapping wings and flying.
}