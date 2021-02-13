import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransaction createState() => _UserTransaction();
}

class _UserTransaction extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 'a',
      title: 'Nike',
      amount: 9000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'b',
      title: 'Adidas',
      amount: 7000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'c',
      title: 'Puma',
      amount: 3000,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
