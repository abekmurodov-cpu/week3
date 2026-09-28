/// An immutable Data Transfer Object (DTO) representing user information.
class UserDto {
  final int id;
  final String username;
  final String email;
  final String role;

  /// A `const` constructor ensuring all fields are assigned and immutable.
  const UserDto({
    required this.id,
    required this.username,
    required this.email,
    this.role = 'user',
  });

  /// Factory constructor to parse raw JSON maps into an immutable DTO.
  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      role: (json['role'] as String?) ?? 'user',
    );
  }

  /// Converts the DTO into a standard map for network transmission.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'role': role,
    };
  }

  @override
  String toString() => 'UserDto(id: $id, username: $username, email: $email, role: $role)';
}

void main() {
  // Creating compile-time constant instances
  const user1 = UserDto(
    id: 1,
    username: 'alex99',
    email: 'alex@example.com',
  );

  const user2 = UserDto(
    id: 1,
    username: 'alex99',
    email: 'alex@example.com',
  );

  // Both point to the exact same canonical instance in memory
  print(identical(user1, user2)); // Output: true

  // Parsing from simulated JSON payload
  final fromApi = UserDto.fromJson({
    'id': 2,
    'username': 'bob_smith',
    'email': 'bob@company.com',
    'role': 'admin',
  });

  print(fromApi); // Output: UserDto(id: 2, username: bob_smith, email: bob@company.com, role: admin)
}