import 'dart:math' as math;

// Superclass
abstract class Shape {
  double area();
}

// Subclass 1
class Circle extends Shape {
  final double radius;
  Circle(this.radius);

  @override
  double area() => math.pi * radius * radius;
}

// Subclass 2
class Rectangle extends Shape {
  final double width;
  final double height;
  Rectangle(this.width, this.height);

  @override
  double area() => width * height;
}

void main() {
  // A polymorphic list containing different implementations of Shape
  final List<Shape> shapes = [
    Circle(5),
    Rectangle(4, 6),
    Circle(2.5),
  ];

  // Calling area() on each shape without needing to know its concrete type
  for (final shape in shapes) {
    print('${shape.runtimeType} Area: ${shape.area().toStringAsFixed(2)}');
  }
  // Output:
  // Circle Area: 78.54
  // Rectangle Area: 24.00
  // Circle Area: 19.63
}