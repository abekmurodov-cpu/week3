// Generic interface/class definition
abstract class Repository<T> {
  void add(T item);
  List<T> getAll();
  T? getById(int id);
}

// In-memory implementation of the generic Repository
class InMemoryRepository<T> implements Repository<T> {
  final List<T> _items = [];

  @override
  void add(T item) {
    _items.add(item);
  }

  @override
  List<T> getAll() => List.unmodifiable(_items);

  @override
  T? getById(int index) {
    if (index >= 0 && index < _items.length) {
      return _items[index];
    }
    return null;
  }
}

// Two different data models
class User {
  final String name;
  User(this.name);
  @override
  String toString() => 'User(name: $name)';
}

class Product {
  final String title;
  final double price;
  Product(this.title, this.price);
  @override
  String toString() => 'Product(title: $title, price: \$$price)';
}

void main() {
  // 1. Repository parameterized with User
  final Repository<User> userRepo = InMemoryRepository<User>();
  userRepo.add(User('Alice'));
  userRepo.add(User('Bob'));
  print(userRepo.getAll()); 
  // Output: [User(name: Alice), User(name: Bob)]

  // 2. The exact same Repository logic parameterized with Product
  final Repository<Product> productRepo = InMemoryRepository<Product>();
  productRepo.add(Product('Laptop', 999.99));
  print(productRepo.getById(0)); 
  // Output: Product(title: Laptop, price: $999.99)
}