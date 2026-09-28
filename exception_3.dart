void processUsername(String? username) {
  // Check for both null and empty values
  if (username == null || username.trim().isEmpty) {
    throw ArgumentError('Username cannot be null, empty, or whitespace.');
  }

  print('Processing user: $username');
}

void main() {
  // 1. Valid input
  processUsername('Alice'); // Output: Processing user: Alice

  // 2. Passing null
  try {
    processUsername(null);
  } on ArgumentError catch (e) {
    print('Failed: ${e.message}'); // Output: Failed: Username cannot be null, empty, or whitespace.
  }

  // 3. Passing empty string
  try {
    processUsername('   ');
  } on ArgumentError catch (e) {
    print('Failed: ${e.message}'); // Output: Failed: Username cannot be null, empty, or whitespace.
  }
}