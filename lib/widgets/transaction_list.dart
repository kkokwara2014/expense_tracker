import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionList = Provider.of<TransactionProvider>(context);
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
      ),
      itemCount: transactionList.transactions.length,
      itemBuilder: (context, index) {
        final tx = transactionList.transactions[index];
        return ListTile(
          onLongPress: () {
            transactionList.deleteTransaction(tx.id);
          },
          title: Text(tx.title),
          subtitle: Text(tx.date.toString()),
          trailing: Text(
            "=N=${tx.amount.toStringAsFixed(2)}",
            style: TextStyle(color: tx.isIncome ? Colors.green : Colors.red),
          ),
        );
      },
    );
  }
}
