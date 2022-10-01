import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/bloc/internet_bloc.dart';
import 'package:flutter_demo/logic/bloc/login_bloc.dart';
import 'package:flutter_demo/logic/cubit/internet_cubit.dart';
import 'package:flutter_demo/logic/cubit/splash_screen_cubit.dart';
import 'package:flutter_demo/logic/states/internet_state.dart';
import 'package:flutter_demo/screen/grid_screen.dart';
import 'package:flutter_demo/screen/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => InternetBloc(),
    //   child: const MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Splash Screens',
    //     home: SplashScreenBloc(),
    //   ),
    // );

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
                        child: GridClass(),
                      )),
                );
                Fluttertoast.showToast(
                    msg: 'This is toast notification',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.yellow
                );
              }
              // else if(state == SplashScreenState.Dashboard){
              //
              // }
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

