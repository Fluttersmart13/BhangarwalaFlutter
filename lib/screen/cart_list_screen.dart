import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/text_widgets.dart';

import '../constants/constants.dart';
import '../widgets/app_bar.dart';

class CartListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ItemAppBar(),
            Expanded(
              flex: 9,
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: color2,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: ListView(
                  children: [
                    CartItemSample(),
                    CartItemSample(),
                    CartItemSample(),
                    CartItemSample(),
                    CartItemSample(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  CartItemSample() {
    return Container(
      height: 110,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Radio(activeColor:color1,value: "", groupValue: "", onChanged: (index) {}),
          ///product image
          Container(height:70,width:70,
              margin: EdgeInsets.only(right: 15),
              child: Image.network("http://www.gravityclasses.co.in/bhangarwala/icons/news_paper.png")),
          ///product title with prize
          Padding(padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SimpleTextWidget(title: "Product Title", fontSize: 22, color: color1, fontWeight: FontWeight.bold),
              SimpleTextWidget(title: "\$55", fontSize: 20, color: textColor, fontWeight: FontWeight.normal)
            ],
          ),
          ),
          ///delete button
          Padding(padding: EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.delete,color: Colors.red,size: 30,),
              Row(children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(color: color1,
                  borderRadius: BorderRadius.circular(20)
                  ),
                )
              ],),
            ],
          ),
          )
        ],
      ),
    );
  }
}
