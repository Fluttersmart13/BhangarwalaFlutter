import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/constants/constants.dart';
import 'package:flutter_demo/logic/bloc/login_bloc.dart';
import 'package:flutter_demo/logic/cubit/auth_cubit.dart';
import 'package:flutter_demo/logic/events/login_event.dart';
import 'package:flutter_demo/logic/states/login_state.dart';
import 'package:flutter_demo/screen/sign_in_screen.dart';
import 'package:flutter_demo/screen/verify_phone_number.dart';

import '../widgets/already_have_an_account_acheck.dart';
import '../widgets/background.dart';
import '../widgets/rounded_button_wigets.dart';
import '../widgets/rounded_input_field.dart';
import '../widgets/rounded_password_field.dart';
import '../widgets/text_widgets.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppLargeText(text: "LOGIN"),
              SizedBox(height: size.height * 0.03),
              Image.asset(
                "assets/images/logo.png",
                height: 200,
                width: 200,
              ),
              // SvgPicture.asset(
              //   "assets/icons/login.svg",
              //   height: size.height * 0.35,
              // ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Enter Phone Number",
                controller: email,
                readOnly: false,
                onChanged: (value) {
                  BlocProvider.of<LoginBloc>(context)
                      .add(TextChangeEvent(email.text, password.text));
                },
              ),
              RoundedPasswordField(
                passenable: true,
                text: "Password",
                controller: password,
                passHideShow: () {},
                onChanged: (value) {
                  BlocProvider.of<LoginBloc>(context)
                      .add(TextChangeEvent(email.text, password.text));
                },
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is ErrorState) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      child: Text(
                        state.errorMessage,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is ApiSuccessState) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return VerifyPhoneNumberScreen();
                        },
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return CircularProgressIndicator(
                      color: color1,
                    );
                  }

                  return RoundedButton(
                    color: state is ValidState ? color1 : Colors.grey,
                    text: "LOGIN",
                    press: () {
                      if (state is ValidState) {
                        BlocProvider.of<LoginBloc>(context)
                            .add(SubmittedEvent(email.text, password.text));
                      }
                      //Auth.saveUserName("soni");
                    },
                  );
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BlocProvider(
                          create: (context) => AuthCubit(),
                          child: SignInScreen(),
                        );
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
