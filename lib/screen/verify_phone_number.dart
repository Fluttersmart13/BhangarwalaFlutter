import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/constants/constants.dart';
import 'package:flutter_demo/widgets/background_signup.dart';
import 'package:flutter_svg/svg.dart';
import '../logic/cubit/auth_cubit.dart';
import '../logic/states/aith_state.dart';
import '../widgets/rounded_button_wigets.dart';
import '../widgets/rounded_input_field.dart';
import '../widgets/text_widgets.dart';
import 'home_screen.dart';

class VerifyPhoneNumberScreen extends StatelessWidget {

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Verify Phone Number"),
      ),
      body: Background(
        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              AppLargeText(text: "LOGIN"),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "6-digit OTP",
                controller: otpController,
                onChanged: (value) {
                },
              ),

              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if(state is AuthLoggedInState) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacement(context, CupertinoPageRoute(
                        builder: (context) => HomeScreen()
                    ));
                  }
                  else if(state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.error),
                          duration: Duration(milliseconds: 2000),
                        )
                    );
                  }

                },
                builder: (context, state) {
                  if(state is AuthLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return RoundedButton(
                    text: "Verify",
                    press: () {
                      BlocProvider.of<AuthCubit>(context).verifyOTP(otpController.text);
                    },
                    color: color1,
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