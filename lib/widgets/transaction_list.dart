import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final Function deleteTransaction;
  final List<Transaction> transactions;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: constraints.maxHeight * .6,
                  child: Image.asset(
                    'assets/img/flowers.png',
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, idx) {
              return TransactionItem(
                  transaction: transactions[idx],
                  deleteTransaction: deleteTransaction);
            },
            itemCount: transactions.length,
          );
  }
}
