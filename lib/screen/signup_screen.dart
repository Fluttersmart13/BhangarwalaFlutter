import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/bloc/login_bloc.dart';
import 'package:flutter_demo/logic/cubit/product_list_cubit.dart';
import 'package:flutter_demo/repositories/product_list_repository.dart';
import 'package:flutter_demo/screen/product_list_screen.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/already_have_an_account_acheck.dart';
import '../widgets/background_signup.dart';
import '../widgets/or_divider.dart';
import '../widgets/rounded_button_wigets.dart';
import '../widgets/rounded_input_field.dart';
import '../widgets/social_icon.dart';
import '../widgets/text_widgets.dart';
import 'login_screen.dart';


class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    TextEditingController _phone = new TextEditingController();
    TextEditingController _password = new TextEditingController();
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppLargeText(
                text: "SIGNUP",
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              RoundedInputField(
                readOnly: true,
                hintText: "Phone Number",
                onChanged: (value) {},
                controller: _phone,
              ),
              // RoundedPasswordField(
              //   controller: _password,
              //   onChanged: (value) {},
              // ),
              RoundedButton(
                text: "SIGN IN",
                press: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return OTPScreen();
                  //     },
                  //   ),
                  // );
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
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
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BlocProvider(
                              create: (context) => ProductListCubit(ProductListRepository()),
                              child: ProductListScreen(),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}