import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.userTransactions, required this.deleteTransaction})
      : super(key: key);
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? Column(
            children: [
              const SizedBox(height: 20),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: userTransactions.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(child: Text('\$${userTransactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    userTransactions[index].title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  subtitle: Text(DateFormat.yMMMd().format(userTransactions[index].date)),
                  trailing: IconButton(
                    onPressed: () => deleteTransaction(userTransactions[index].id),
                    icon: const Icon(Icons.delete_sharp),
                    color: Theme.of(context).errorColor,
                  ),
                ),
              );
            },
          );
  }
}
