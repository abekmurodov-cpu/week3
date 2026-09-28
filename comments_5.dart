/// A base service defining notification behavior.
abstract class NotificationService {
  /// Sends a message to the target destination.
  void send(String message);
}

/// A service implementation for sending push notifications.
class PushNotificationService extends NotificationService {
  /// Dispatches a push notification with the provided [message].
  ///
  /// Implements [NotificationService.send] to deliver alerts via APNs or FCM.
  @override
  void send(String message) {
    print('Sending push notification: $message');
  }

  /// Sends a push notification with an explicit priority flag.
  ///
  /// Deprecated because priority flags are now automatically inferred by payload size.
  /// Use [send] directly instead.
  @Deprecated('Use send(message) instead. Scheduled for removal in v2.0.0.')
  void sendWithPriority(String message, int priority) {
    print('[Priority: $priority] $message');
  }
}

void main() {
  final service = PushNotificationService();

  // Modern method
  service.send('System update available');

  // Deprecated method (IDE will strike through the method call)
  // ignore: deprecated_member_use
  service.sendWithPriority('Emergency alert', 1);
}