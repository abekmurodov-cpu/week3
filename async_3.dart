Future<String> fetchUserProfile() async {
  await Future.delayed(const Duration(milliseconds: 800));
  return 'User Profile Data';
}

Future<List<String>> fetchUserOrders() async {
  await Future.delayed(const Duration(milliseconds: 1200));
  return ['Order #101', 'Order #102'];
}

Future<int> fetchUnreadNotifications() async {
  await Future.delayed(const Duration(milliseconds: 500));
  return 3;
}

void main() async {
  final stopwatch = Stopwatch()..start();
  print('Running 3 tasks concurrently...');

  // All three tasks run at the same time
  final results = await Future.wait([
    fetchUserProfile(),
    fetchUserOrders(),
    fetchUnreadNotifications(),
  ]);

  stopwatch.stop();

  // Extract results by their index in the list
  final String profile = results[0] as String;
  final List<String> orders = results[1] as List<String>;
  final int notificationCount = results[2] as int;

  print('--- Aggregated Results ---');
  print('Profile: $profile');
  print('Orders: $orders');
  print('Notifications: $notificationCount');
  print('Total elapsed time: ${stopwatch.elapsedMilliseconds} ms');
  // Notice total time is ~1200ms (longest task), not 800 + 1200 + 500 = 2500ms
}