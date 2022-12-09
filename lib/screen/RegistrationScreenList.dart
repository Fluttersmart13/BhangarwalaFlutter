import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationScreenList extends StatelessWidget {
  const RegistrationScreenList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: LAlertWidget()),
    );
  }
}

class LAlertWidget extends StatelessWidget {
  const LAlertWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Function to Show SnackBar on dialog dismiss

    void _showSnackBar(String text, String ans) {
      final SnackBar snackBar = SnackBar(
          duration: const Duration(milliseconds: 500),
          backgroundColor:
              ans.compareTo('Yes') == 0 ? Colors.green : Colors.red,
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

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
              child: const Text('Simple Dialog'),
              onPressed: () {
                // AlertDialogBox(title: "", yesPress: () {  }).simpleDialog(context);
              }),
          // ElevatedButton(
          //   child: const Text('Alert Dialog'),
          //   onPressed: _alertDialog,
          // ),
          // ElevatedButton(
          //   child: const Text('Date Picker Dialog'),
          //   onPressed: _datePickerDialog,
          // ),
          // ElevatedButton(
          //   child: const Text('Timer Picker Dialog'),
          //   onPressed: _timerDialog,
          // ),
          // ElevatedButton(
          //   child: const Text('Cupertino Dialog'),
          //   onPressed: _cupertinoDialog,
          // )
        ],
      ),
    );
  }
}
