import 'package:cost/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';
import 'transaction.dart';

class TransactionList extends StatelessWidget {
  final List<transaction> transactions;
  Function delete_transactions;
  TransactionList(this.transactions, this.delete_transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(
              children: [
                Text('No transaction added yet',
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 20),
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
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    trailing: IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        delete_transactions(transactions[index].id);
                      },
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text('\$${transactions[index].cost}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].object,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle: Text(DateTimeFormat.format(transactions[index].d,
                        format: DateTimeFormats.american)),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
