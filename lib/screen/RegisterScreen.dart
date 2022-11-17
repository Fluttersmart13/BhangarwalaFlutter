import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/constants.dart';

import '../moordb/database_helpers.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  final _databaseInstance = AppDatabase.sharedInstance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 100,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: "Name"),
                  controller: name,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Date of birth"),
                  controller: dob,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Email id"),
                  controller: email,
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    print("object1${name.text}");
                    print("object1${dob.text}");
                    print("object1${email.text}");
                    DBUser user = DBUser(
                        name: name.text.toString(),
                        email: email.text.toString(),
                        dob: dob.text.toString(),
                        id: '2');
                    UsersDao(_databaseInstance).addUser(user);
                    getalluser().then((value) {
                      print(value);
                    });
                  },
                  child: Container(
                    color: color1,
                    width: 100,
                    height: 50,
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<DBUser>> getalluser() async {
  List<DBUser> users = [];
  final _databaseInstance = AppDatabase.sharedInstance;
  try {
    final _users = await UsersDao(_databaseInstance).getAllUser();

    if (_users != null) {
      users.addAll(_users);
    }
  } catch (ex) {
    users = [];
  }

  return users;
}
