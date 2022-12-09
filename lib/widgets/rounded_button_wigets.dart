import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final String button_key;
  final Function() press;
  final Color color, textColor;
  const RoundedButton({
    required this.text,
    required this.press,
    required this.button_key,
    this.color = color1,
    this.textColor = Colors.white,
  }) : super();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (button_key == "1") {
      return InkWell(
        onTap: press,
        child: Container(
            height: 60,
            width: size.width * 0.88,
            decoration: BoxDecoration(
                border: Border.all(width: 3, color: color1),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                shape: BoxShape.rectangle,
                color: Colors.white),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16, color: color1),
              ),
            )),
      );
    } else {
      return InkWell(
        onTap: press,
        child: Container(
            height: 60,
            width: size.width * 0.88,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                shape: BoxShape.rectangle,
                color: color1),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
            )),
      );
    }
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom
  Widget newElevatedButton() {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
              color: textColor, fontSize: 14, fontWeight: FontWeight.w500)),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
