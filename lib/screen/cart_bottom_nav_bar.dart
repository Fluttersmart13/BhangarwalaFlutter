import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/constants.dart';
import 'package:flutter_demo/logic/cubit/product_list_cubit.dart';

import '../widgets/text_widgets.dart';

class CartBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: color2,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleTextWidget(
                    title: "Total",
                    fontSize: 22,
                    color: color1,
                    fontWeight: FontWeight.bold),
                StreamBuilder(
                    stream: bloc.getStream,
                    initialData: bloc.cartList,
                    builder: (context, snapshot) {
                      return SimpleTextWidget(
                          title: "${bloc.getTotalAmount()} ₹",
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.normal);
                    }),
              ],
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: color1,
              ),
              child: SimpleTextWidget(
                  title: "Check Out",
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
