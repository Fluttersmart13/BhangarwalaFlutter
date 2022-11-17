import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/text_widgets.dart';

import '../constants/constants.dart';

class DashBoardScreen1 extends StatelessWidget {
  const DashBoardScreen1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: CupertinoColors.inactiveGray,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Image.asset("assets/images/old_items.png"),
                      ),
                      SizedBox(
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
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: CupertinoColors.inactiveGray,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Image.asset("assets/images/old_items.png"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SimpleTextWidget(
                          title: "News Paper",
                          fontSize: 14,
                          color: color1,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: CupertinoColors.inactiveGray,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Image.asset("assets/images/old_items.png"),
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
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: CupertinoColors.inactiveGray,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Image.asset("assets/images/old_items.png"),
                      ),
                      SimpleTextWidget(
                          title: "News Paper",
                          fontSize: 14,
                          color: color1,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color:
                                CupertinoColors.inactiveGray.withOpacity(0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Image.asset("assets/images/old_items.png"),
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
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            color: CupertinoColors.inactiveGray,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Image.asset("assets/images/old_items.png"),
                      ),
                      SimpleTextWidget(
                          title: "News Paper",
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
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: color1,
          items: <Widget>[
            Icon(
              Icons.add,
              size: 20,
              color: color3,
            ),
            Icon(
              Icons.list,
              size: 20,
              color: color3,
            ),
            Icon(
              Icons.compare_arrows,
              size: 20,
              color: color3,
            ),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      ),
    );
  }
}
