sealed class NetworkState {}

class Loading extends NetworkState {}
class Success extends NetworkState {
  final String data;
  Success(this.data);
}
class Failure extends NetworkState {
  final String error;
  Failure(this.error);
}

// Exhaustive pattern matching using a switch expression
String handleState(NetworkState state) => switch (state) {
  Loading() => 'Loading...',
  Success(data: final d) => 'Data: $d',
  Failure(error: final e) => 'Error: $e',
};

void main() {
  print(handleState(Loading()));          // Loading...
  print(handleState(Success('OK')));       // Data: OK
  print(handleState(Failure('Timeout')));  // Error: Timeout
}