void processOrder() {
  try {
    throw Exception('Payment gateway offline');
  } catch (e) {
    print('Logging error inside helper: $e');
    // Forwards the original exception up the call stack
    rethrow;
  }
}

void main() {
  try {
    processOrder();
  } catch (e) {
    print('Handled by caller in main: $e');
  }
}

// Output:
// Logging error inside helper: Exception: Payment gateway offline
// Handled by caller in main: Exception: Payment gateway offline