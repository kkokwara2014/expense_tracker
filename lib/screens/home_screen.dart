import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:expense_tracker/widgets/add_transaction.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:expense_tracker/widgets/transaction_summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final transaction = Provider.of<TransactionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        centerTitle: true,
        elevation: 0,
      ),
      body: transaction.transactions.isEmpty
          ? const Center(
              child: Text(
                "No Transaction details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.all(4),
              child: const Column(
                children: [
                  TransactionSummary(),
                  Expanded(child: TransactionList()),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                // padding: EdgeInsets.only(
                //   bottom: MediaQuery.of(context).viewInsets.bottom,
                // ),
                child: const AddTransaction(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
