/// Simulates querying a database for a user by [userId].
Future<Map<String, dynamic>> fetchUserData(int userId) async {
  print('Querying database for user #$userId...');

  // Simulate a 2-second database lookup delay
  await Future.delayed(const Duration(seconds: 2));

  // Return the fetched data
  return {
    'id': userId,
    'name': 'Sarah Connor',
    'email': 'sarah@example.com',
    'status': 'active',
  };
}

void main() async {
  print('Start lookup: ${DateTime.now()}');
  
  final user = await fetchUserData(42);
  
  print('Result received: $user');
  print('End lookup: ${DateTime.now()}');
}