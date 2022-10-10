import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/constants.dart';
import 'package:flutter_demo/widgets/text_widgets.dart';

class ItemAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,
            size: 30,
              color: color1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: AppLargeText( text: "Product",color: color1,size: 20,),),
          Spacer(),
          // Icon(Icons.favorite,color: Colors.red,)
        ],
      ),
    );
  }

}