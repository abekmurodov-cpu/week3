/// Represents a structured response returned by an API operation.
///
/// Contains the HTTP [statusCode] and the payload [data].
class ApiResponse<T> {
  /// The HTTP response status code (e.g., 200, 404).
  final int statusCode;

  /// The parsed response payload of type [T], or `null` if the request failed.
  final T? data;

  /// A human-readable message accompanying the response.
  final String message;

  /// Creates an [ApiResponse] container with the specified metadata.
  const ApiResponse({
    required this.statusCode,
    required this.message,
    this.data,
  });

  /// Whether the response indicates a successful HTTP status code (200–299).
  bool get isSuccess => statusCode >= 200 && statusCode < 300;
}

/// Exception thrown when an [ApiClient] network or protocol operation fails.
class ApiException implements Exception {
  /// The error message explaining the failure.
  final String message;

  /// The associated HTTP status code, if available.
  final int? statusCode;

  /// Creates an [ApiException] with a descriptive [message] and optional [statusCode].
  const ApiException(this.message, [this.statusCode]);

  @override
  String toString() => 'ApiException: $message (status: $statusCode)';
}

/// An HTTP client service for communicating with remote backend services.
///
/// ### Example Usage
/// ```dart
/// final client = ApiClient(baseUrl: 'https://api.example.com');
/// try {
///   final response = await client.get('/users');
///   print(response.data);
/// } on ApiException catch (e) {
///   print('API Error: ${e.message}');
/// }
/// ```
class ApiClient {
  /// The root URL for all requests made by this client.
  final String baseUrl;

  /// Optional authentication bearer token included in request headers.
  final String? authToken;

  /// Creates a new [ApiClient] configured with the target [baseUrl].
  ///
  /// Throws an [ArgumentError] if [baseUrl] is empty.
  ApiClient({
    required this.baseUrl,
    this.authToken,
  }) {
    if (baseUrl.trim().isEmpty) {
      throw ArgumentError.value(baseUrl, 'baseUrl', 'Base URL cannot be empty.');
    }
  }

  /// Sends a simulated GET request to the specified [endpoint].
  ///
  /// Parameters:
  /// * [endpoint]: The sub-path appended to [baseUrl] (must start with `/`).
  /// * [headers]: Additional HTTP headers to send alongside standard headers.
  ///
  /// Returns an [ApiResponse] containing the raw response body string.
  ///
  /// Throws an [ArgumentError] if [endpoint] does not start with a `/`.
  /// Throws an [ApiException] if the request simulates a network failure.
  Future<ApiResponse<String>> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    if (!endpoint.startsWith('/')) {
      throw ArgumentError.value(
        endpoint,
        'endpoint',
        'Endpoint path must start with a leading slash ("/").',
      );
    }

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));

    // Simulated successful response
    return ApiResponse<String>(
      statusCode: 200,
      message: 'OK',
      data: '{"status": "success", "resource": "$endpoint"}',
    );
  }
}