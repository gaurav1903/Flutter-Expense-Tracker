import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'transaction.dart';

class each extends StatelessWidget {
  const each({
    Key key,
    @required this.l,
  }) : super(key: key);

  final List<transaction> l;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: l.map((x) {
        return Row(
          children: [
            Card(
              child: Text(x.cost.toString()),
            ),
            Column(children: [
              Card(
                child: Text(x.object),
              ),
              Card(child: Text(x.d.toString()))
            ])
          ],
        );
      }).toList(),
    );
  }
}
