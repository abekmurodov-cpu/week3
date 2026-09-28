enum AccountType {
  free(maxProjects: 3, label: "Basic Plan"),
  premium(maxProjects: 50, label: "Pro Plan"),
  enterprise(maxProjects: 999, label: "Corporate Plan");

  // Final instance fields
  final int maxProjects;
  final String label;

  // Const constructor
  const AccountType({required this.maxProjects, required this.label});

  // Regular method or getter
  bool get hasUnlimitedAccess => this == AccountType.enterprise;
}

void main() {
  var userPlan = AccountType.premium;
  
  print(userPlan.label);              // Output: Pro Plan
  print(userPlan.maxProjects);        // Output: 50
  print(userPlan.hasUnlimitedAccess); // Output: false
}
