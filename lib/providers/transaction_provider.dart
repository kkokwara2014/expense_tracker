import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transactions = [];

  //getter for the transactions
  List<Transaction> get transactions => _transactions;

  //getting all the incomes
  double get totalIcome => _transactions
      .where((tx) => tx.isIncome)
      .fold(0, (sum, tx) => sum + tx.amount);

  //get total expenses
  double get totalExpenses => _transactions
      .where((tx) => !tx.isIncome)
      .fold(0, (sum, tx) => sum + tx.amount);

  //calculate remaining balance
  double get remainingBalance => totalIcome - totalExpenses;

  //add new transaction
  void addTransaction(String title, double amount, bool isIncome) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now(),
        isIncome: isIncome);

    _transactions.insert(0, newTransaction);
    notifyListeners();
  }

  //delete transaction
  void deleteTransaction(String id) {
    _transactions.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }
}
