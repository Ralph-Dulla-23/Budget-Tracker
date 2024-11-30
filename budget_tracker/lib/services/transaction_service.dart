import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:budget_tracker/models/transaction.dart';

class TransactionService extends StateNotifier<List<Transaction>> {
  TransactionService() : super([]); // Initial state is an empty list

  void addTransaction(Transaction transaction) {
    state = [...state, transaction]; // Add new transaction to the list
  }

  void removeTransaction(Transaction transaction) {
    state = state.where((t) => t != transaction).toList(); // Remove the specified transaction
  }

  double calculateBalance() {
    return state.fold(
      0.0,
      (sum, transaction) => sum + (transaction.isExpense ? -transaction.amount : transaction.amount),
    );
  }
}