import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/route/router_constants.dart';

import '../constants/constants.dart';
import '../logic/cubit/auth_cubit.dart';
import '../widgets/text_widgets.dart';
import 'RegistrationScreenList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 140,
          leading: Container(),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
          backgroundColor: color1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Image.asset("assets/images/logo.png")),
              const SizedBox(
                width: 10,
              ),
              Text(APP_NAME),
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          //Navigator.pushNamed(context, routeProductList, arguments: "papers");

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationScreenList()),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: CupertinoColors.inactiveGray,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.asset("assets/images/news_paper.png"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SimpleTextWidget(
                          title: "News Paper",
                          fontSize: 14,
                          color: color1,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, routeProductList,
                              arguments: "olditems");
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: CupertinoColors.inactiveGray,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.asset("assets/images/old_items.png"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SimpleTextWidget(
                          title: "OLD Items",
                          fontSize: 14,
                          color: color1,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, routeProductList,
                              arguments: "bottles");
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: CupertinoColors.inactiveGray,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child:
                              Image.asset("assets/images/plastic_bottle.png"),
                        ),
                      ),
                      SimpleTextWidget(
                          title: "Bottles",
                          fontSize: 14,
                          color: color1,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, routeProductList,
                              arguments: "books");
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: CupertinoColors.inactiveGray,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.asset("assets/images/books_scrap.png"),
                        ),
                      ),
                      SimpleTextWidget(
                          title: "Books",
                          fontSize: 14,
                          color: color1,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, routeProductList,
                              arguments: "metal");
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color:
                                  CupertinoColors.inactiveGray.withOpacity(0.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Image.asset("assets/images/iron.png"),
                        ),
                      ),
                      SimpleTextWidget(
                          title: "Metals",
                          fontSize: 14,
                          color: color1,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, routeProductList,
                              arguments: "computer");
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: CupertinoColors.inactiveGray,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.asset("assets/images/computer.png"),
                        ),
                      ),
                      SimpleTextWidget(
                          title: "Computer",
                          fontSize: 14,
                          color: color1,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
