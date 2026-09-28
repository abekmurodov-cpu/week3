class Circle {
  final double radius;
  final double area;

  // Calculates and sets 'area' before the body runs
  Circle(double r) 
      : radius = r, 
        area = 3.14159 * r * r; 
}
