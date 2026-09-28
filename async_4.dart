import 'dart:async';

void main() {
  // Create a stream that emits a tick every 500 milliseconds
  final Stream<int> tickStream = Stream.periodic(
    const Duration(milliseconds: 500),
    (count) => count + 1, // Emits: 1, 2, 3, ...
  );

  late StreamSubscription<int> subscription;

  print('Starting timer stream...');

  // Subscribe to the stream
  subscription = tickStream.listen((tick) async {
    print('Tick received: $tick');

    // Cancel after receiving 5 emissions
    if (tick >= 5) {
      print('Reached 5 emissions. Canceling subscription...');
      await subscription.cancel();
      print('Stream subscription cancelled successfully.');
    }
  });
}