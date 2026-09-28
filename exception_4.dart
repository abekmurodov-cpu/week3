void executeOperation(String input) {
  try {
    if (input == 'format') {
      int.parse('not_a_number'); // Throws FormatException
    } else if (input == 'range') {
      List<int> numbers = [1, 2];
      print(numbers[5]); // Throws RangeError
    } else if (input == 'custom') {
      throw Exception('A generic unexpected exception occurred');
    }
  } on FormatException catch (e) {
    // Handles only FormatException
    print('Handling FormatException: Invalid number format (${e.message})');
  } on RangeError catch (e) {
    // Handles only RangeError
    print('Handling RangeError: Index was out of bounds (${e.message})');
  } on Exception catch (e) {
    // Handles any other specific Exception type
    print('Handling standard Exception: $e');
  } catch (e) {
    // Fallback handler for anything else (e.g., Error types)
    print('Handling unknown/generic error: $e');
  }
}

void main() {
  executeOperation('format'); // Caught by FormatException block
  executeOperation('range');  // Caught by RangeError block
  executeOperation('custom'); // Caught by Exception block
}