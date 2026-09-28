// 1. Interface definition
abstract interface class DBConnector {
  void connect();
  void disconnect();
}

// 2. Concrete implementation
class MySQLConnector implements DBConnector {
  @override
  void connect() {
    print('Connecting to MySQL database...');
  }

  @override
  void disconnect() {
    print('Disconnected from MySQL database.');
  }
}

void main() {
  DBConnector db = MySQLConnector();
  db.connect();    // Output: Connecting to MySQL database...
  db.disconnect(); // Output: Disconnected from MySQL database.
}