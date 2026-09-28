void triggerError() {
  throw FormatException('Invalid data received');
}

void main() {
  try {
    triggerError();
  } catch (error, stackTrace) {
    print('Error: $error');
    print('--- Stack Trace ---');
    print(stackTrace); // Prints the exact line numbers and call chain
  }
}