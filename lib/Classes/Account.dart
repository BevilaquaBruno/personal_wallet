class Account {
  final int id;
  final String name;
  final double balance;
  final double initialBalance;

  const Account({
    required this.id,
    required this.name,
    required this.balance,
    required this.initialBalance,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'balance': balance,
      'initialBalance': initialBalance,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Account{id: $id, name: $name, balance: $balance, initialBalance: $initialBalance}';
  }
}
