import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/bloc/internet_bloc.dart';
import 'package:flutter_demo/logic/bloc/login_bloc.dart';
import 'package:flutter_demo/logic/cubit/splash_screen_cubit.dart';
import 'package:flutter_demo/logic/states/internet_state.dart';
import 'package:flutter_demo/route/router_constants.dart';
import 'package:flutter_demo/screen/login_screen.dart';
import 'package:flutter_demo/screen/sign_in_screen.dart';

import 'logic/cubit/auth_cubit.dart';
import 'logic/states/aith_state.dart';
import 'route/routes.dart';

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
        // theme: ThemeData(
        //   brightness: Brightness.dark,
        //   primaryColor: Colors.lightBlue[800],
        //   fontFamily: 'Georgia',
        //   textTheme: const TextTheme(
        //     headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //     headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //     bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        //   ),
        // ),
        debugShowCheckedModeBanner: true,
        title: 'Splash Screens',
        home: SplashScreen(),
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: routeSplash,
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
            if (state is InternetLostState) {
              const snackbar = SnackBar(
                content: Text('No Internet"'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            } else {
              const snackbar = SnackBar(
                content: Text('loadding'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          }, builder: (context, state) {
            if (state is InternetGainedSate) {
              return Text("Internet");
            } else if (state is InternetLostState) {
              return Text("No Internet");
            } else {
              return Text("Loading");
            }
          }),
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
              if (state == SplashScreenState.Welcome) {
                Navigator.pushNamed(context, routeWelcome);
              } else if (state == SplashScreenState.Intro) {
                Navigator.pushNamed(context, routeIntro);
              } else if (state == SplashScreenState.Dashboard) {
                Navigator.pushNamed(context, routeDashboard);
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  // Container(
                  //     height: 100,
                  //     width: 100,
                  //     child: Image(image:AssetImage("assets/images/logo.png"))),
                  // SizedBox(height: 20,),
                  // SimpleTextWidget(title: intro_title1, fontSize: 24, color: color1, fontWeight: FontWeight.bold,),
                ],
              );
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
            if (state is AuthLoggedInState) {
              return BlocProvider(
                create: (context) => LoginBloc(),
                child: LoginScreen(),
              );
            } else if (state is AuthLoggedOutState) {
              return SignInScreen();
            } else {
              return Scaffold();
            }
          },
        ),
      ),
    );
  }
}
