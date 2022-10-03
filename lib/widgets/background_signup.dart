import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    required this.child,
  }) : super();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            // child: Image.asset(
            //   "assets/images/signup_top.png",
            //   width: size.width * 0.35,
            // ),
            child:Container(
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                  color: color3,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(250))
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            // child: Image.asset(
            //   "assets/images/main_bottom.png",
            //   width: size.width * 0.25,
            // ),
            child:Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: color3,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(250))
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}