import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() {
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.redAccent,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
//    Transaction(
//      id: 't1',
//      title: 'New Shoes',
//      amount: 50.00,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: 'New Shirt',
//      amount: 25.53,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: 'New Shirt',
//      amount: 25.53,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: 'New Shirt',
//      amount: 25.53,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: 'New Shirt',
//      amount: 25.53,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: 'New Shirt',
//      amount: 25.53,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: 'New Shirt',
//      amount: 25.53,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: 'New Shirt',
//      amount: 25.53,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: 'New Shirt',
//      amount: 25.53,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: 'New Shirt',
//      amount: 25.53,
//      date: DateTime.now(),
//    ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String transactionTitle, double transactionAmount, DateTime choosenDate) {
    final newTransaction = Transaction(
      title: transactionTitle,
      amount: transactionAmount,
      date: choosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String transactionId) {
    setState(() {
      _userTransactions.removeWhere((transaction) {
        return transaction.id == transactionId;
      });
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Expense Tracker'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.3,
              child: Chart(_recentTransactions),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.7,
              child: TransactionList(_userTransactions, _deleteTransaction),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
