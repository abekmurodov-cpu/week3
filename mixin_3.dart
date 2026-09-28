// 1. Define the mixin
mixin Flyable {
  void fly() {
    print('Soaring through the sky!');
  }
}

// 2. Apply the mixin to a class using `with`
class Bird with Flyable {
  final String name;

  Bird(this.name);
}

void main() {
  final eagle = Bird('Eagle');
  print(eagle.name); // Output: Eagle
  eagle.fly();       // Output: Soaring through the sky!
}