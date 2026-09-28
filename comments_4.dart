/// Validates a credit card number using the standard Luhn algorithm.
///
/// **Important:** This method checks only the mathematical validity of the
/// card number; it does **not** verify whether the account is open, active,
/// or has sufficient funds.
///
/// ### Validation Rules
/// The provided [cardNumber] must adhere to the following constraints:
/// * Must contain between **13 and 19** total digits.
/// * May use spaces (` `) or hyphens (`-`) as digit grouping separators.
/// * Must pass the standard **modulus 10** (Luhn) checksum.
///
/// ### Example Usage
/// ```dart
/// try {
///   final isValid = DataValidator.validateCreditCard('4532-1488-1234-5678');
///   if (isValid) {
///     processPayment();
///   }
/// } on FormatException catch (e) {
///   print('Card validation failed: ${e.message}');
/// }
/// ```
///
/// Returns `true` if the number passes the Luhn check.
///
/// Throws a [FormatException] if [cardNumber] contains invalid characters 
/// or fails the checksum.
 bool validateCreditCard(String cardNumber) {
  // Strip allowed separators: spaces and dashes
  final sanitized = cardNumber.replaceAll(RegExp(r'[\s-]'), '');

  // Check if string contains only digits and meets length bounds
  if (!RegExp(r'^\d{13,19}$').hasMatch(sanitized)) {
    throw const FormatException(
      'Card number must contain between 13 and 19 digits.',
    );
  }

  // Luhn algorithm implementation
  int sum = 0;
  bool alternate = false;

  for (int i = sanitized.length - 1; i >= 0; i--) {
    int digit = int.parse(sanitized[i]);

    if (alternate) {
      digit *= 2;
      if (digit > 9) {
        digit -= 9;
      }
    }

    sum += digit;
    alternate = !alternate;
  }

  if (sum % 10 != 0) {
    throw const FormatException('Card number failed the Luhn checksum.');
  }

  return true;
}