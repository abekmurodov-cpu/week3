int divideNumbers(int a, int b) {
  try {
    // Truncating integer division (~/) throws UnsupportedError if b is 0
    return a ~/ b;
  } on UnsupportedError catch (e) {
    print('Caught error: Cannot divide by zero ($e)');
    return 0; // Return fallback value
  }
}

void main() {
  print(divideNumbers(10, 2)); // Output: 5
  print(divideNumbers(10, 0)); // Output: Caught error: Cannot divide by zero (...) \n 0
}