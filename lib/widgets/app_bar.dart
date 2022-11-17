import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/constants.dart';
import 'package:flutter_demo/widgets/text_widgets.dart';

class ItemAppBar extends StatelessWidget {
  final int cartCount;
  final Function() onclick;
  final Function() backpress;
  final bool isCart;
  final bool isBackpress;
  ItemAppBar(
      {required this.cartCount, required this.onclick, required this.backpress,
        required this.isCart,
        required this.isBackpress,
      })
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: Colors.white,
      child: Stack(
        children: [
          isBackpress?Positioned(
            top: 15,
            left: 0,
            child: InkWell(
              onTap: backpress,
              child: const Icon(
                Icons.arrow_back,
                size: 30,
                color: color1,
              ),
            ),
          ):Container(),
          Positioned(
            top: 15,
            left: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AppLargeText(
                text: "Product",
                color: color1,
                size: 20,
              ),
            ),
          ),
          isCart?Positioned(
            top: 25,
            right: 25,
            child: InkWell(
              onTap: onclick,
              child: const Icon(
                Icons.shopping_cart,
                size: 30,
                color: color1,
              ),
            ),
          ):Container(),
          isCart?Positioned(
            top: 15,
            right: 20,
            child: InkWell(
              onTap: onclick,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    "$cartCount",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12
                    ),
                  ),
                ),
              ),
            ),
          ):Container(),
          // Icon(Icons.favorite,color: Colors.red,)
        ],
      ),
    );
  }
}
