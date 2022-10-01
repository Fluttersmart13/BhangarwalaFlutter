import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   child: Image.asset(
          //     "assets/images/main_top.png",
          //     width: size.width * 0.35,
          //   ),
          // ),
          Positioned(
            top: 0,
            left: 0,
            // child: Image.asset(
            //   "assets/images/main_top.png",
            //   width: size.width * 0.3,
            // ),
            child:Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                  color: color2,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(250))
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            // child: Image.asset(
            //   "assets/images/main_top.png",
            //   width: size.width * 0.3,
            // ),
            child:Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: color2,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(150))
              ),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Image.asset(
          //     "assets/images/login_bottom.png",
          //     width: size.width * 0.4,
          //   ),
          // ),
          child,
        ],
      ),
    );
  }
}
