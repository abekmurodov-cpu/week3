class Animal {
  final String name;
  Animal(this.name);
}

// Only classes that extend Animal can use this mixin
mixin Musical on Animal {
  void playInstrument() => print('$name is making music!');
}

// Allowed: Dog extends Animal
class Dog extends Animal with Musical {
  Dog(super.name);
}

// NOT allowed: Compile error because Car does not extend Animal
// class Car with Musical {}

void main() {
  final dog = Dog('Buddy');
  dog.playInstrument(); // Output: Buddy is making music!
}