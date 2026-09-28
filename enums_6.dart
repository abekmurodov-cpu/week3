/// A generic enhanced enum mapping data types to their default values and labels.
enum DataType<T> {
  // Each enum value specifies its generic type argument and constructor inputs
  string<String>(defaultValue: '', label: 'Text'),
  integer<int>(defaultValue: 0, label: 'Number'),
  boolean<bool>(defaultValue: false, label: 'Boolean'),
  stringList<List<String>>(defaultValue: [], label: 'List of Strings');

  /// The default placeholder value of type [T].
  final T defaultValue;

  /// Human-readable display label.
  final String label;

  const DataType({
    required this.defaultValue,
    required this.label,
  });

  // --- Static Helper Methods ---

  /// Finds and returns the [DataType] entry by its human-readable [label].
  static DataType? findByLabel(String label) {
    for (final type in DataType.values) {
      if (type.label.toLowerCase() == label.trim().toLowerCase()) {
        return type;
      }
    }
    return null;
  }

  /// Validates whether a given runtime object [value] matches this enum's type [T].
  bool isCompatible(Object? value) => value is T;
}

void main() {
  // 1. Accessing generic enum properties
  const intType = DataType.integer;
  print('${intType.label} default value: ${intType.defaultValue}'); 
  // Output: Number default value: 0

  // 2. Using instance helper method with type checking
  print('Is 42 an integer type? ${intType.isCompatible(42)}');       // Output: true
  print('Is "abc" an integer type? ${intType.isCompatible("abc")}'); // Output: false

  // 3. Using static helper method
  final foundType = DataType.findByLabel('Text');
  print('Found: $foundType'); // Output: Found: DataType.string

  final notFound = DataType.findByLabel('Unknown');
  print('Found: $notFound');  // Output: Found: null
}