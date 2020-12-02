import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String name;
  final int daytotal;
  final double percentage;
  ChartBar({this.name, this.daytotal, this.percentage});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
              height: 20,
              child:
                  FittedBox(child: Text('\$${daytotal.toStringAsFixed(0)}'))),
          SizedBox(height: 5),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Text(name),
        ],
      ),
    );
  }
}
