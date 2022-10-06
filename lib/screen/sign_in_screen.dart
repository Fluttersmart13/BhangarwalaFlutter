import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/screen/signup_screen.dart';
import 'package:flutter_demo/screen/verify_phone_number.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';
import '../logic/cubit/auth_cubit.dart';
import '../logic/states/aith_state.dart';
import '../widgets/already_have_an_account_acheck.dart';
import '../widgets/background_signup.dart';
import '../widgets/rounded_button_wigets.dart';
import '../widgets/rounded_input_field.dart';
import '../widgets/rounded_password_field.dart';
import '../widgets/text_widgets.dart';


//cubit with Signup screen
class SignInScreen extends StatelessWidget {

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool readOnly = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: Background(
          child: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppLargeText(text: "Registration"),
              SizedBox(height: size.height * 0.03),
              // SvgPicture.asset(
              //   "assets/icons/login.svg",
              //   height: size.height * 0.35,
              // ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Enter Phone number",
                controller: phoneController,
                readOnly: readOnly,
                onChanged: (value) {

                },
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthErrorState) {
                    return Text("Invalid Phone Number", style: TextStyle(
                        color: Colors.red
                    ),);
                  } else {
                    return Container();
                  }
                },
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if(state is AuthLoggedInState){
                    readOnly = true;
                    return RoundedPasswordField(
                        text: "Password",
                        onChanged: (value) {

                        },
                        controller: passwordController
                    );
                  }else {
                    return Container();
                  }

                },
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoggedInState) {
                    return RoundedPasswordField(
                        text: "Confirm Password",
                        onChanged: (value) {
                        },
                        controller: passwordController
                    );
                  } else {
                    return Container();
                  }
                },
              ),

              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthCodeSentState) {
                    Navigator.push(context, CupertinoPageRoute(
                        builder: (context) => VerifyPhoneNumberScreen()
                    ));
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return CircularProgressIndicator(color: color1,);
                  }

                  return RoundedButton(
                    color: color1,
                    text: "Send notification",
                    press: () {
                      String phoneNumber = "+91" + phoneController.text;
                      BlocProvider.of<AuthCubit>(context).sendOTP(phoneNumber);
                    },
                  );
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
                          create: (context) => AuthCubit(),
                          child: SignUpScreen(),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),),
        ),
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       centerTitle: true,
//       title: Text("Sign In with Phone"),
//     ),
//     body: SafeArea(
//       child: ListView(
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextField(
//                   controller: phoneController,
//                   maxLength: 10,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: "Phone Number",
//                     counterText: ""
//                   ),
//                 ),
//
//                 SizedBox(height: 10,),
//
//                 BlocConsumer<AuthCubit, AuthState>(
//                   listener: (context, state) {
//
//                     if(state is AuthCodeSentState) {
//                       Navigator.push(context, CupertinoPageRoute(
//                         builder: (context) => VerifyPhoneNumberScreen()
//                       ));
//                     }
//
//                   },
//                   builder: (context, state) {
//
//                     if(state is AuthLoadingState) {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//
//                     return SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       child: CupertinoButton(
//                         onPressed: () {
//                           String phoneNumber = "+91" + phoneController.text;
//                           BlocProvider.of<AuthCubit>(context).sendOTP(phoneNumber);
//                         },
//                         color: Colors.blue,
//                         child: Text("Sign In"),
//                       ),
//                     );
//
//                   },
//                 ),
//
//               ],
//             ),
//           ),
//
//         ],
//       ),
//     ),
//   );
// }


}