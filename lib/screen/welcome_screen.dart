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
              SizedBox(height: size.height * 0.05),
              Image.asset(
                "assets/images/logo.png",
                height: size.height * 0.45,
                width: size.width * 0.45,
              ),
              AppLargeText(
                text: WELCOME_TITLE,
                color: TEXT_LABEL,
              ),
              // SvgPicture.asset(
              //   "assets/icons/chat.svg",
              //   height: size.height * 0.45,
              // ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "LOGIN",
                color: Colors.white,
                textColor: Colors.black,
                press: () {
                  Navigator.pushNamed(context, routeLogin);
                },
                button_key: '1',
              ),
              const SizedBox(height: 20),
              RoundedButton(
                text: "SIGN UP",
                color: color1,
                textColor: Colors.white,
                press: () {
                  Navigator.pushNamed(context, routeSignUp);
                },
                button_key: '0',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
