void main() async {
  final stream = Stream.fromIterable([1, 2, 2, 3, 4, 4, 5, 6]);

  stream
      .where((n) => n.isEven)       // Keep only even numbers: 2, 2, 4, 4, 6
      .distinct()                   // Remove consecutive duplicates: 2, 4, 6
      .map((n) => 'Value: ${n * 10}') // Multiply by 10
      .listen(print);
  
  // Output:
  // Value: 20
  // Value: 40
  // Value: 60
}