class MySingleton {
  // 1. Private static instance initialized lazily upon first access
  static final MySingleton _instance = MySingleton._internal();

  // 2. Private named constructor to prevent instantiation outside this file
  MySingleton._internal() {
    // Perform initialization logic here (e.g., opening a database, setting up logs)
  }

  // 3. Static factory constructor
  // The 'factory' keyword allows this constructor to return the cached static instance
  factory MySingleton() {
    return _instance;
  }
}
