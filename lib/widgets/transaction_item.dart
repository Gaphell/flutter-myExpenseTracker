import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    @required this.transaction,
    @required this.deleteTransaction,
  });

  final Transaction transaction;
  final Function deleteTransaction;

  @override 
  Widget build(BuildContext context) {
    return Card(
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 4,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: FittedBox(
                        child: Text(
                          '${transaction.amount}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transaction.title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transaction.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 500
                      ? TextButton.icon(
                          onPressed: () =>
                              deleteTransaction(transaction.id),
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete'),
                        )
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () =>
                              deleteTransaction(transaction.id),
                        ),
                ),
              );
  }
}