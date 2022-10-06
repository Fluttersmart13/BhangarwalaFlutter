import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/bloc/login_bloc.dart';
import 'package:flutter_demo/screen/sign_in_screen.dart';
import 'package:flutter_demo/screen/signup_screen.dart';
import 'package:flutter_demo/screen/verify_phone_number.dart';

import '../constants/constants.dart';
import '../widgets/background_signup.dart';
import '../widgets/rounded_button_wigets.dart';
import '../widgets/text_widgets.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppLargeText(text: WELCOME_TITLE, color: color1,),
              SizedBox(height: size.height * 0.05),
              Image.asset("assets/images/logo.png",
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BlocProvider(
                          create: (context) => LoginBloc(),
                          child: LoginScreen(),
                        );
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                text: "SIGN UP",
                color: color4,
                textColor: Colors.black,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignInScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}