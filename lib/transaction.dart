import 'package:flutter/material.dart';

class transaction {
  final int cost;
  final String id, object;
  final DateTime d;
  transaction(
      {@required this.cost,
      @required this.id,
      @required this.object,
      @required this.d});
}
