import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewTransaction extends StatefulWidget {
  final Function func;

  NewTransaction(this.func);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountcontroller = TextEditingController();

  final itemcontroller = TextEditingController();
  DateTime selecteddate;
  void submitData() {
    final enteredTitle = itemcontroller.text;
    final enteredAmount = int.parse(amountcontroller.text);
    if (enteredTitle.isEmpty ||
        enteredAmount < 0 ||
        enteredAmount == null ||
        selecteddate == null) {
      return;
    }
    widget.func(enteredTitle, enteredAmount, selecteddate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) return;
      setState(() {
        selecteddate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Product'),
            controller: itemcontroller,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountcontroller,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          Container(
            height: 70,
            child: Expanded(
              child: Row(children: [
                Expanded(
                  child: Text(selecteddate == null
                      ? 'No date chosen'
                      : DateTimeFormat.format(selecteddate,
                          format: DateTimeFormats.american)),
                ),
                SizedBox(width: 20),
                RaisedButton(
                  textColor: Theme.of(context).primaryColor,
                  color: Colors.white,
                  onPressed: _presentDatePicker,
                  child: Text(
                    'choose date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ),
          ),
          OutlinedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.greenAccent),
            ),
            onPressed: submitData,
            child: Text(
              'Save',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
