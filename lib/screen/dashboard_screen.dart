import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class DashBoardScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: color1,
        height: 50,
        items: <Widget>[
          Icon(Icons.add, size: 20,color: color3,),
          Icon(Icons.list, size: 20,color: color3,),
          Icon(Icons.compare_arrows, size: 20,color: color3,),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }

}