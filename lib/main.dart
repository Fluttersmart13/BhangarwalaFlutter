import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/bloc/internet_bloc.dart';
import 'package:flutter_demo/logic/bloc/login_bloc.dart';
import 'package:flutter_demo/logic/cubit/internet_cubit.dart';
import 'package:flutter_demo/logic/cubit/splash_screen_cubit.dart';
import 'package:flutter_demo/logic/states/internet_state.dart';
import 'package:flutter_demo/repositories/product_list_repository.dart';
import 'package:flutter_demo/screen/grid_screen.dart';
import 'package:flutter_demo/screen/home_screen.dart';
import 'package:flutter_demo/screen/intro_screen.dart';
import 'package:flutter_demo/screen/login_screen.dart';
import 'package:flutter_demo/screen/product_list_screen.dart';
import 'package:flutter_demo/screen/sign_in_screen.dart';
import 'package:flutter_demo/screen/signup_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'logic/cubit/auth_cubit.dart';
import 'logic/cubit/product_list_cubit.dart';
import 'logic/states/aith_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'Splash Screens',
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreenBloc extends StatelessWidget {
  const SplashScreenBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
              listener: (context, state) {
                if (state is InternetGainedSate) {
                  // final snackbar = SnackBar(
                  //   content: const Text('Internet'),
                  // );
                  // ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  // Fluttertoast.showToast(
                  //     msg: 'This is toast notification',
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.BOTTOM,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Colors.red,
                  //     textColor: Colors.yellow
                  // );
                }
                else if (state is InternetLostState) {
                  final snackbar = SnackBar(
                    content: const Text('No Internet"'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
                else {
                  final snackbar = SnackBar(
                    content: const Text('loadding'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              },
              builder: (context, state) {
                if (state is InternetGainedSate) {
                  return Text("Internet");
                }
                else if (state is InternetLostState) {
                  return Text("No Internet");
                }
                else {
                  return Text("Loading");
                }
              }
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<SplashScreenCubit, SplashScreenState>(
            listener: (context, state) {
              if (state == SplashScreenState.Login) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      BlocProvider(
                        create: (context) => LoginBloc(),
                        child: IntroScreen(),
                      )),
                );
              }

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return BlocProvider(
              //         create: (context) => ProductListCubit(ProductListRepository()),
              //         child: ProductListScreen(),
              //       );
              //     },
              //   ),
              // );
            },
            builder: (context, state) {
              return Text("Splash Screen");
            },
          ),
        ),
      ),
    );
  }
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (oldState, newState) {
            return oldState is AuthInitialState;
          },
          builder: (context, state) {
            // if(state is AuthLoggedInState) {
            //   return BlocProvider(
            //     create: (context) => LoginBloc(),
            //     child: LoginScreen(),
            //   );
            // }
            // else if(state is AuthLoggedOutState) {
            //   return SignInScreen();
            // }
            // else {
            //   return Scaffold();
            // }

            return SignUpScreen();
          },
        ),
      ),
    );
  }
}