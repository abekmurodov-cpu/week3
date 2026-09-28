// Strategy Interface
abstract interface class DiscountStrategy {
  double applyDiscount(double price);
}

// Concrete Strategies
class NoDiscount implements DiscountStrategy {
  @override
  double applyDiscount(double price) => price;
}

class VipDiscount implements DiscountStrategy {
  @override
  double applyDiscount(double price) => price * 0.8; // 20% off
}

// Context delegating the algorithm to the strategy
class Cart {
  DiscountStrategy strategy;
  Cart(this.strategy);

  double checkout(double total) => strategy.applyDiscount(total);
}

void main() {
  final regularCart = Cart(NoDiscount());
  print(regularCart.checkout(100)); // 100.0

  // Swap strategy dynamically at runtime
  final vipCart = Cart(VipDiscount());
  print(vipCart.checkout(100)); // 80.0
}