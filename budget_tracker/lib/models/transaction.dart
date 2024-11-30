class Transaction {
  final String description;
  final double amount;
  final String category;
  final DateTime date;
  final bool isExpense;

  Transaction({
    required this.description,
    required this.amount,
    required this.category,
    required this.date,
    required this.isExpense,
  });
}