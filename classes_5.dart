class BankAccount {
  final String accountHolder;

  // Private backing field
  double _balance;

  BankAccount(this.accountHolder, [double initialBalance = 0.0])
      : _balance = initialBalance >= 0
            ? initialBalance
            : throw ArgumentError('Initial balance cannot be negative.');

  /// Custom getter to read the balance.
  double get balance => _balance;

  /// Formatted read-only getter for presentation.
  String get formattedBalance => '\$${_balance.toStringAsFixed(2)}';

  /// Custom setter enforcing domain business rules before updating state.
  ///
  /// Constraints:
  /// * Balance cannot be set to a negative number.
  /// * Balance cannot exceed 1,000,000 for standard accounts.
  set balance(double newBalance) {
    if (newBalance < 0) {
      throw ArgumentError.value(
        newBalance,
        'newBalance',
        'Account balance cannot be negative.',
      );
    }
    if (newBalance > 1000000) {
      throw RangeError.range(
        newBalance,
        0,
        1000000,
        'newBalance',
        'Balance exceeds maximum insured limit.',
      );
    }

    _balance = newBalance;
  }
}

void main() {
  final account = BankAccount('Jane Doe', 500.0);
  print(account.formattedBalance); // Output: $500.00

  // 1. Valid update via setter
  account.balance = 750.50;
  print(account.formattedBalance); // Output: $750.50

  // 2. Violating negative domain constraint
  try {
    account.balance = -50.0;
  } on ArgumentError catch (e) {
    print('Failed: ${e.message}'); // Output: Failed: Account balance cannot be negative.
  }

  // 3. Violating upper bound constraint
  try {
    account.balance = 2000000.0;
  } on RangeError catch (e) {
    print('Failed: ${e.message}'); // Output: Failed: Balance exceeds maximum insured limit.
  }
}