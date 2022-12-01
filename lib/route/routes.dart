import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/bloc/login_bloc.dart';
import 'package:flutter_demo/logic/cubit/auth_cubit.dart';
import 'package:flutter_demo/route/router_constants.dart';
import 'package:flutter_demo/screen/cart_list_screen.dart';
import 'package:flutter_demo/screen/dashboard.dart';
import 'package:flutter_demo/screen/intro_screen.dart';
import 'package:flutter_demo/screen/login_screen.dart';
import 'package:flutter_demo/screen/sign_in_screen.dart';
import 'package:flutter_demo/screen/stack_screen.dart';

import '../logic/cubit/internet_cubit.dart';
import '../logic/cubit/product_list_cubit.dart';
import '../main.dart';
import '../repositories/product_list_repository.dart';
import '../screen/RegisterScreen.dart';
import '../screen/cart_screen.dart';
import '../screen/product_list_screen.dart';
import '../screen/welcome_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case routeLogin:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginBloc(),
            child: LoginScreen(),
          ),
        );
      case routeSignUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: SignInScreen(),
          ),
        );
      case routeIntro:
        return MaterialPageRoute(
          builder: (_) => IntroScreen(),
        );
      case routeDemo:
        return MaterialPageRoute(
          builder: (_) => StackScreen(),
        );

      case routeDashboard:
        return MaterialPageRoute(
          builder: (_) => RootScreen(),
        );

      case routeRegisterdemo:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        );

      case routeCartItem:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductListCubit(ProductListRepository()),
            child: CartItemScreen(),
          ),
        );
      case routeProductList:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ProductListCubit(ProductListRepository()),
              ),
              BlocProvider(create: (context) => InternetCubit()),
            ],
            child: ProductListScreen(category: settings.arguments.toString()),
          ),
        );
      case routeCartList:
        return MaterialPageRoute(
          builder: (_) => CartListScreen(),
        );
      case routeWelcome:
        return MaterialPageRoute(
          builder: (_) => WelcomeScreen(),
        );

      default:
        return null;
    }
  }
}
