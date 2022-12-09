import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogBox {
  final String title;
  final Function() yesPress;
  final Function() noPress;
  AlertDialogBox({
    required this.yesPress,
    required this.noPress,
    required this.title,
  }) : super();

  Future<void> simpleDialog(BuildContext context) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Simple Dialog, Is it nice?'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'Yes');
                },
                child: const Text('Yes'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'No');
                },
                child: const Text('No'),
              ),
            ],
          );
        })) {
      case 'Yes':
        _showSnackBar('Thanks!', 'Yes', context);
        break;
      case 'No':
        _showSnackBar('Oh! No... Try to provide you best', 'No', context);
        break;
    }
  }

  Future<void> alertDialog(BuildContext context) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('Is it nice?'),
            title: const Text('Alert Dialog'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Yes');
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'No');
                },
                child: const Text('No'),
              ),
            ],
          );
        })) {
      case 'Yes':
        _showSnackBar('Thanks!', 'Yes', context);
        break;
      case 'No':
        _showSnackBar('Oh! No... Try to provide you best', 'No', context);
        break;
    }
  }

  void timerDialog(BuildContext context) {
    final DateTime now = DateTime.now();
    showTimePicker(
            context: context,
            initialTime: TimeOfDay(hour: now.hour, minute: now.minute))
        .then((TimeOfDay? onValue) {
      _showSnackBar(onValue?.format(context) ?? '', 'ok', context);
    });
  }

  void datePickerDialog(BuildContext context) {
    final DateTime now = DateTime.now();
    showDatePicker(
            context: context,
            initialDate: now,
            firstDate: DateTime(2000),
            lastDate: DateTime(2050))
        .then((DateTime? onValue) {
      _showSnackBar('$onValue', 'ok', context);
    });
  }

  Future<void> cupertinoDialog(BuildContext context) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Welcome'),
            content: const Text('Cupertino Dialog, Is it nice?'),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context, 'Yes');
                },
                child: const Text('Yes'),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context, 'No');
                },
                child: const Text('No'),
              ),
            ],
          );
        })) {
      case 'Yes':
        _showSnackBar('Thanks!', 'Yes', context);
        break;
      case 'No':
        _showSnackBar('Oh! No... Try to provide you best', 'No', context);
        break;
    }
  }
}

void _showSnackBar(String text, String ans, BuildContext context) {
  final SnackBar snackBar = SnackBar(
      duration: const Duration(milliseconds: 500),
      backgroundColor: ans.compareTo('Yes') == 0 ? Colors.green : Colors.red,
      content: Row(
        children: <Widget>[
          Icon(
            ans.compareTo('Yes') == 0 ? Icons.favorite : Icons.watch_later,
            color: ans.compareTo('Yes') == 0 ? Colors.pink : Colors.yellow,
            size: 24.0,
            semanticLabel: text,
          ),
          Text(text)
        ],
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
