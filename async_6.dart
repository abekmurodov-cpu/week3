import 'dart:async';

void main() {
  final controller = StreamController<int>();

  // Stream pipeline with handleError
  controller.stream
      .map((n) => n == 0 ? throw Exception('Zero is not allowed') : n * 2)
      .handleError((error) => print('Caught error: $error'))
      .listen((val) => print('Processed: $val'));

  // Emit values and trigger the error
  controller.add(5); // Processed: 10
  controller.add(0); // Caught error: Exception: Zero is not allowed
  controller.add(3); // Processed: 6

  controller.close();
}