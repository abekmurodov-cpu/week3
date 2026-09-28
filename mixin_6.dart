mixin class Greeter {
  void greet() => print('Hello from Greeter!');
}

// 1. INTERFACE (implements): Must provide your own implementation
class GermanSpeaker implements Greeter {
  @override
  void greet() => print('Hallo!'); 
}

// 2. MIXIN (with): Reuses the existing greet() method as-is
class StandardPerson with Greeter {}

void main() {
  // implements: uses the overridden method
  final german = GermanSpeaker();
  german.greet(); // Output: Hallo!

  // with: reuses Greeter's original logic
  final person = StandardPerson();
  person.greet(); // Output: Hello from Greeter!
}