import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../route/router_constants.dart';
import '../widgets/background_signup.dart';
import '../widgets/rounded_button_wigets.dart';
import '../widgets/text_widgets.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppLargeText(
                text: WELCOME_TITLE,
                color: color1,
              ),
              SizedBox(height: size.height * 0.05),
              Image.asset(
                "assets/images/logo.png",
                height: size.height * 0.45,
                width: size.width * 0.45,
              ),
              // SvgPicture.asset(
              //   "assets/icons/chat.svg",
              //   height: size.height * 0.45,
              // ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "LOGIN",
                color: color1,
                press: () {
                  Navigator.pushNamed(context, routeLogin);
                },
              ),
              RoundedButton(
                text: "SIGN UP",
                color: color4,
                textColor: Colors.black,
                press: () {
                  Navigator.pushNamed(context, routeSignUp);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
