import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/text_widgets.dart';

import '../../constants/constants.dart';

class SimpleCardWidgets extends StatelessWidget {
  final String img_url;
  final String label;
  final Function press;
  final Color color;
  const SimpleCardWidgets({
    required Key? key,
    required this.img_url,
    required this.label,
    required this.press,
    this.color = color1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: color3,
                      elevation: 5,
                      child: new Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Image.asset(
                          img_url,
                          width: 120,
                          height: 120,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: AppLargeText(
                      text: label,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
