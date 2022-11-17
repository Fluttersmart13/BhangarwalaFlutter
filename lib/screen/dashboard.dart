import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/screen/cart_list_screen.dart';
import 'package:flutter_demo/screen/welcome_screen.dart';

import '../constants/constants.dart';
import '../logic/cubit/navigation_cubit.dart';
import 'home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: Scaffold(
        body: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return HomeScreen();
          } else if (state.navbarItem == NavbarItem.settings) {
            return CartListScreen();
          } else if (state.navbarItem == NavbarItem.profile) {
            return WelcomeScreen();
          }
          return Container();
        }),
        bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            return CurvedNavigationBar(
              index: state.index,
              color: color1,
              height: 55,
              backgroundColor: Colors.white,
              items: [
                Icon(
                  Icons.home,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.shopping_cart,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.white,
                ),
              ],
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.home);
                } else if (index == 1) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.settings);
                } else if (index == 2) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.profile);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
