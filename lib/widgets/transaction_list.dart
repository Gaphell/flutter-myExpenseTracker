import 'package:flutter/material.dart';
import 'package:my_expense_tracker/models/transaction.dart';
import 'package:my_expense_tracker/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Text(
                  'Empty',
                  style: Theme.of(context).textTheme.title,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        // : ListView.builder(
        //     itemBuilder: (context, index) {
        //       return TransactionItem(
        //           transaction: transactions[index],
        //           deleteTransaction: deleteTransaction);
        //     },
        //     itemCount: transactions.length,
        //   );
        : ListView(
            children: transactions
                .map((transaction) => TransactionItem(
                      key: ValueKey(transaction.id),
                      transaction: transaction,
                      deleteTransaction: deleteTransaction,
                    ))
                .toList());
  }
}
