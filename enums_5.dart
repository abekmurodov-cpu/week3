enum Priority {
  low,
  medium,
  high,
  critical,
}

/// Safely converts a raw string into a [Priority] enum.
///
/// Returns `null` (or a fallback) if [name] does not match any entry.
Priority? parsePrioritySafely(String? name) {
  if (name == null) return null;

  try {
    // Normalizes input to lowercase and attempts lookup
    return Priority.values.byName(name.trim().toLowerCase());
  } on ArgumentError {
    // Thrown by byName() when no matching enum name exists
    print('Warning: "$name" is not a valid Priority value.');
    return null; // Return null (or a fallback like Priority.low)
  }
}

void main() {
  // 1. Valid string matches
  final p1 = parsePrioritySafely('high');
  print('Result: $p1'); // Output: Result: Priority.high

  final p2 = parsePrioritySafely('MEDIUM');
  print('Result: $p2'); // Output: Result: Priority.medium

  // 2. Invalid string input (handled safely without crashing)
  final p3 = parsePrioritySafely('super_urgent');
  print('Result: $p3'); // Output: Warning: "super_urgent" is not a valid Priority value. \n Result: null
}