import 'package:cost/transaction.dart';
import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';
import 'chartbar.dart';

class Chart extends StatelessWidget {
  final List<transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: 6 - index));
      int total = 0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].d.day == weekday.day &&
            recentTransactions[i].d.month == weekday.month &&
            recentTransactions[i].d.year == weekday.year)
          total += recentTransactions[i].cost;
      }
      return {
        'day': DateTimeFormat.format(weekday, format: 'D'),
        'amount': total
      };
    });
  }

  int get maxSpending {
    return groupedTransactionsValues.fold(0, (sum, item) {
      return sum = sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactionsValues.map((m) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  name: m['day'],
                  daytotal: m['amount'],
                  percentage: maxSpending == 0
                      ? 0
                      : (m['amount'] as int) / maxSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
