// ============================================================================
// FILE: secure_system.dart (Library A)
// ============================================================================

/// 1. A FINAL CLASS:
/// Outside this library, NO class can extend, implement, or mix in [EncryptionKey].
/// This completely prevents subclassing and overriding.
final class EncryptionKey {
  final String secret;

  EncryptionKey(this.secret);

  void printLength() => print('Key length: ${secret.length}');
}

/// 2. A BASE CLASS:
/// Outside this library, classes CAN extend [SecureConnection],
/// but they CANNOT use `implements SecureConnection`.
/// This guarantees the original base logic cannot be bypassed or mocked out.
base class SecureConnection {
  final String serverUrl;

  SecureConnection(this.serverUrl);

  void connect() {
    print('Connecting securely to $serverUrl...');
  }
}

// ============================================================================
// FILE: app.dart (Library B - importing secure_system.dart)
// ============================================================================

// --- What happens when you try to subclass them from outside: ---

// ❌ COMPILE ERROR: The class 'EncryptionKey' cannot be extended outside its library.
// class CustomKey extends EncryptionKey { ... }

// ❌ COMPILE ERROR: The class 'EncryptionKey' cannot be implemented outside its library.
// class MockKey implements EncryptionKey { ... }

// ❌ COMPILE ERROR: The class 'SecureConnection' cannot be implemented outside its library.
// class FakeConnection implements SecureConnection { ... }

// ✅ ALLOWED: You can extend a `base` class, provided the subclass is also marked `base` or `final`:
final class HttpsConnection extends SecureConnection {
  HttpsConnection(super.serverUrl);

  @override
  void connect() {
    super.connect();
    print('HTTPS handshake completed.');
  }
}

void main() {
  final key = EncryptionKey('super-secret-123');
  key.printLength(); // Output: Key length: 16

  final conn = HttpsConnection('https://api.myapp.com');
  conn.connect();
  // Output:
  // Connecting securely to https://api.myapp.com...
  // HTTPS handshake completed.
}