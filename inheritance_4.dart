class Shape {
  void draw() => print('Drawing a shape');
  final int dimension;
  Shape(this.dimension);

}

class Polygon extends Shape {
  final int sides;
  
  
  Polygon(this.sides) : super(2);
  
  @override
  void draw() {
    super.draw();
    print('Drawing a polygon with $sides sides');
  }
}


class Triangle extends Polygon {
  Triangle() : super(3);

  @override
  void draw() {
    super.draw();
    print('Drawing a triangle');
  }
}
