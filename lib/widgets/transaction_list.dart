import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final Function deleteTransaction;
  final List<Transaction> transactions;
  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('No Transactions!'),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/img/flowers.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, idx) {
                return Card(
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$ ${transactions[idx].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[idx].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(transactions[idx].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteTransaction(transactions[idx].id),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
