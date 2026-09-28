/// A custom exception thrown when a data validation constraint fails.
class ValidationException implements Exception {
  /// A message describing the validation failure.
  final String message;

  /// Creates a [ValidationException] with the provided [message].
  const ValidationException(this.message);

  @override
  String toString() => 'ValidationException: $message';
}



/// Validates a [password] against complexity and length requirements.
  ///
  /// The [password] must:
  /// * Be at least [minLength] characters long.
  /// * Contain at least one uppercase letter if [requireUppercase] is `true`.
  /// * Contain at least one numeric digit if [requireDigit] is `true`.
  ///
  /// Returns the validated [password] unchanged if it passes all checks.
  ///
  /// Throws a [RangeError] if [minLength] is less than 1.
  /// Throws a [ValidationException] if the password does not meet the specified criteria.
String requireValidPassword(
    String password, {
    int minLength = 8,
    bool requireUppercase = true,
    bool requireDigit = true,
  }) {
    if (minLength < 1) {
      throw RangeError.range(minLength, 1, null, 'minLength');
    }
    if (password.length < minLength) {
      throw ValidationException(
        'Password must be at least $minLength characters long.',
      );
    }
    if (requireUppercase && !password.contains(RegExp(r'[A-Z]'))) {
      throw const ValidationException(
        'Password must contain at least one uppercase letter.',
      );
    }
    if (requireDigit && !password.contains(RegExp(r'[0-9]'))) {
      throw const ValidationException(
        'Password must contain at least one numeric digit.',
      );
    }

    return password;
  }