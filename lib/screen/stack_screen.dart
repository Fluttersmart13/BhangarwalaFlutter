import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../constants/constants.dart';
import '../widgets/text_widgets.dart';

class StackScreen extends StatefulWidget {
  @override
  State<StackScreen> createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color2,
      body: SingleChildScrollView(
        child: Container(
          color: color2,
          margin: new EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Neumorphic(
                margin: EdgeInsets.all(8),
                style: NeumorphicStyle(
                    depth: 2,
                    shadowLightColor: color3,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                    shape: NeumorphicShape.flat,
                    color: color2),
                child: Container(
                    margin: new EdgeInsets.symmetric(horizontal: 20.0),
                    width: width,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu, color: color1),
                        Row(
                          children: [
                            Icon(Icons.search, color: color1),
                            Icon(Icons.more_vert, color: color1),
                          ],
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              AppLargeText(text: "Service", color: color1,
                size: 24,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    color: color2,
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5, bottom: 10),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Stack(
                                children: [
                                  Positioned(child: Image.asset("assets/images/Rectangle145.png")),
                                  Positioned(
                                      child: Image.asset("assets/images/Rectangle151.png")),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: AppLargeText(
                    text: "Doctor of the month",
                    color: color1,
                    size: 24,
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Ellipse1.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: CircularPercentIndicator(
                        radius: 70,
                        lineWidth: 15.0,
                        percent: 0.7,
                        progressColor: color1,
                        backgroundColor: color2,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppLargeText(
                          text: "Lorem ipsum",
                          color: color1,
                          size: 24
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Lorem ipsum dolor sit amet,consectetur adipiscing elit.Etiam eu turpis molestie ,dictum est a,mat")
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              AppLargeText(
                text: "Problems",
                color: color1,
                size: 24,
              ),
              SizedBox(
                height: 20,

              ),
              Container(
                color: color2,
                height: MediaQuery.of(context).size.width * 0.80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.70,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image:
                                  AssetImage("assets/images/Rectangle29.png"),
                              fit: BoxFit.cover,
                            )),
                          ),
                          // Positioned(
                          //   top: 150,
                          //   left: 70,
                          //   child: Container(
                          //     height: 70,
                          //     child: Center(
                          //         child: Text("Lorem",style: TextStyle(
                          //             fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold
                          //         ),)),
                          //     decoration: BoxDecoration(
                          //         image: DecorationImage(
                          //           image: AssetImage("assets/images/Rectangle31.png"),
                          //           fit: BoxFit.fitWidth,
                          //         )
                          //     ),
                          //   ),
                          // ),
                          Positioned(
                              top: 150,
                              left: 70,
                              child: Text(
                                "Lorem ipsum",
                                style: TextStyle(
                                    color: text, fontWeight: FontWeight.bold),
                              )),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: AppLargeText(
                    text: "Booking",
                    color: color1,
                    size: 24,
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: new EdgeInsets.only(left: 10.0),
                  width: width,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Neumorphic(
                              style: NeumorphicStyle(
                                  depth: 2,
                                  shadowLightColor: color3,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(20)),
                                  shape: NeumorphicShape.flat,
                                  color: color2),
                              child: Container(
                                  height: 40, width: 40, child: Text(""))),
                          SizedBox(
                            width: 20,
                          ),
                          SimpleTextWidget(
                            title: "Lorem ipsum",
                            fontSize: 20,
                            color: color1,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Neumorphic(
                              style: NeumorphicStyle(
                                  depth: 2,
                                  shadowLightColor: color3,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(15)),
                                  shape: NeumorphicShape.flat,
                                  color: color2),
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: color1,
                                  ))),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      )
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              AppLargeText(
                text: "Know more",
                color: color1,
                size: 24,
              ),
              SizedBox(
                height: 30,
              ),
              buildStack(),
              SizedBox(
                height: 10,
              ),
              buildStack(),
              SizedBox(
                height: 10,
              ),
              buildStack(),
              SizedBox(
                height: 30,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: AppLargeText(
                    text: "Offers",
                    color: color1,
                    size: 24,
                  )),
              SizedBox(
                height: 10,
              ),
              buildNeumorphicOffers(),
              buildNeumorphicOffers(),
              buildNeumorphicOffers(),
              buildNeumorphicOffers(),
              Container(
                width: width,
                height: 100,
                decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))
                    //borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildNeumorphicOffers() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          image: DecorationImage(
            image:
            AssetImage("assets/images/Rectangle170.png"),
            fit: BoxFit.cover,
          ),
          color: color2
      ),
      margin: new EdgeInsets.only(left: 10.0),
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Align(
            alignment: Alignment.centerLeft,
            child: SimpleTextWidget(
              title: "Lorem ipsum",
              fontSize: 20,
              color: color1,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }

  Stack buildStack() {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: width,
            height: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                  AssetImage("assets/images/Rectangle42.png"),
                  fit: BoxFit.cover,
                ),
              color: color2
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: "Lorem ipsum",
                    color: Colors.black,
                    size: 24,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/Ellipse10.png"),
                      fit: BoxFit.cover,
                    )),
                    child: Container(
                        height: 60,
                        width: 60,
                        child: Image.asset("assets/images/Vector.png")),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Positioned(
        //   top: 10,
        //   left: -10,
        //   child: Container(
        //     width: 80,
        //     height: 80,
        //     decoration: BoxDecoration(
        //         image: DecorationImage(
        //       image: AssetImage("assets/images/Rectangle44.png"),
        //       fit: BoxFit.cover,
        //     )),
        //   ),
        // ),
      ],
    );
  }
}


// class StackScreen extends StatefulWidget{
//   @override
//   State<StackScreen> createState() => _StackScreenState();
// }
//
// class _StackScreenState extends State<StackScreen> {
//   late double height;
//   late double width;
//   @override
//   Widget build(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width= MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: color2,
//       // appBar: NeumorphicAppBar(color: color2,centerTitle:,),
//       body: SingleChildScrollView(
//         child:Container(
//           margin: new EdgeInsets.symmetric(horizontal: 15.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 60,),
//               Neumorphic(
//                 margin: EdgeInsets.all(8),
//                 style: NeumorphicStyle(
//                     depth: 2,
//                     shadowLightColor: color3,
//                     boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
//                     shape: NeumorphicShape.flat,
//                     color: color2
//                 ),
//                 child: Container(
//                     margin: new EdgeInsets.symmetric(horizontal: 20.0),
//                     width: width,
//                     height: 50,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Icon(Icons.menu, color: color1),
//                         Row(children: [
//                           Icon(Icons.search, color: color1),
//                           Icon(Icons.more_vert, color: color1),
//                         ],)
//                       ],
//
//                     )),
//               ),
//               SizedBox(height: 20,),
//               AppLargeText(text: "Service",color: color1),
//               SizedBox(height: 20,),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     color: color2,
//                     height: 200,
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 2,
//                         // physics: NeverScrollableScrollPhysics(),
//                         itemBuilder: (BuildContext context, int index) {
//                           return Padding(
//                             padding: const EdgeInsets.only(left: 5.0,right: 5,bottom: 10),
//                             child: Neumorphic(
//                               style: NeumorphicStyle(
//                                   depth: 2,
//                                   shadowLightColor: color3,
//                                   boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
//                                   shape: NeumorphicShape.concave,
//                                   color: color2
//                               ),
//                               child: Container(
//                                 height: 200,
//                                 width: 170,
//                                 child: Stack(
//                                   children: [
//                                     Neumorphic(
//                                       style: NeumorphicStyle(
//                                           depth: 2,
//                                           shadowLightColor: color2,
//                                           boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
//                                           shape: NeumorphicShape.flat,
//                                           color: color2
//                                       ),
//                                       child: Container(
//                                         height: 70,
//                                         width: 260,
//                                         child: Center(
//                                             child: Container(
//                                               height: 20,
//                                               width: 20,
//                                               color: Colors.yellow,
//                                               child: Center(
//                                                 child: Text(".Z.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold
//                                                 ),),
//                                               ),
//                                             )),
//                                         decoration: BoxDecoration(
//                                             color: color2,
//                                             borderRadius: BorderRadius.circular(30),
//                                             boxShadow: [
//                                               const BoxShadow(
//                                                 color: color2,
//                                                 offset: Offset(10, 10),
//                                                 blurRadius: 30,
//                                                 spreadRadius: 1,
//                                               ),
//                                               const BoxShadow(
//                                                 color: color2,
//                                                 offset: Offset(-10, -10),
//                                                 blurRadius: 30,
//                                                 spreadRadius: 0.5,
//                                               ),
//
//                                             ]
//                                         ),
//                                       ),
//                                     ),
//                                     Positioned(
//                                         top: 100,
//                                         left: 20,
//                                         child: Column(
//                                           children: [
//                                             Text("Lorem",style: TextStyle(
//                                                 fontWeight: FontWeight.bold
//                                             ),),
//                                             SizedBox(height: 30,),
//                                             Neumorphic(
//                                               style: NeumorphicStyle(
//                                                   depth: 2,
//                                                   shadowLightColor: color2,
//                                                   boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
//                                                   shape: NeumorphicShape.flat,
//                                                   color: color2
//                                               ),
//                                               child: LinearPercentIndicator(
//                                                 width: 140.0,
//                                                 lineHeight: 15.0,
//                                                 percent: 0.7,
//                                                 backgroundColor: color2,
//                                                 progressColor: color1,
//                                               ),
//                                             ),
//                                           ],
//                                         )),
//
//                                   ],
//                                 ),
//                                 decoration: BoxDecoration(
//                                     color: color2,
//                                     borderRadius: BorderRadius.circular(30),
//                                     boxShadow: [
//                                       const BoxShadow(
//                                         color: color2,
//                                         offset: Offset(10, 10),
//                                         blurRadius: 30,
//                                         spreadRadius: 1,
//                                       ),
//                                       const BoxShadow(
//                                         color: color2,
//                                         offset: Offset(-10, -10),
//                                         blurRadius: 30,
//                                         spreadRadius: 1,
//                                       ),
//                                     ]
//                                 ),
//                               ),
//                             ),
//                           );
//                         }
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20,),
//               Align(
//                   alignment: Alignment.topRight,
//                   child: AppLargeText(text: "Doctor of the month",color: color1,)),
//               SizedBox(height: 20,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(height: 200,width: 200, child: Neumorphic(
//                     style: NeumorphicStyle(
//                         depth: 6,
//                         shadowLightColor: color3,
//                         boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
//                         shape: NeumorphicShape.concave,
//                         color: color2
//                     ),
//                     child: CircularPercentIndicator(
//                       radius: 80.0,
//                       lineWidth: 15.0,
//                       percent: 0.7,
//                       progressColor: color1,
//                       backgroundColor: color3,
//                     ),
//                   )),
//                   SizedBox(width: 10,),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         AppLargeText(text: "Lorem ipsum",color: color1,size: 25,),
//                         SizedBox(height: 10,),
//                         Text("Lorem ipsum dolor sit amet,consectetur adipiscing elit.Etiam eu turpis molestie ,dictum est a,mat")
//
//                         // Container(
//                         //     height: 50,
//                         //     //child: Expanded(child: SimpleTextWidget(title: "Lorem ipsum dolor sit amet,consectetur adipiscing elit.Etiam eu turpis molestie ,dictum est a,mat"))),
//                         //     child: Expanded(child: SimpleTextWidget(title: "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.\nEtiam eu turpis molestie ,\ndictum est a,mat"))),
//                       ],),
//                   )
//                 ],
//               ),
//               SizedBox(height: 20,),
//               AppLargeText(text: "Problems",color: color1,size: 35,),
//               SizedBox(height: 20,),
//               Center(
//                 child: Container(
//                   color: color2,
//                   height: 230,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 3,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(left: 5.0,right: 5,bottom: 10),
//                           child: Neumorphic(
//                             style: NeumorphicStyle(
//                                 depth: 2,
//                                 shadowLightColor: color3,
//                                 boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
//                                 shape: NeumorphicShape.concave,
//                                 color: color2
//                             ),
//                             child: Container(
//                               height: 220,
//                               width: 150,
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     height: 80,
//                                     width: 150,
//                                     child: Center(
//                                         child: Text("Lorem",style: TextStyle(
//                                             fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold
//                                         ),)),
//                                     decoration: BoxDecoration(
//                                         color: color1,
//                                         borderRadius: BorderRadius.only(topLeft:Radius.circular(50),topRight: Radius.circular(50)),
//                                         boxShadow: [
//                                           const BoxShadow(
//                                             color: color2,
//                                             offset: Offset(10, 10),
//                                             blurRadius: 30,
//                                           ),
//                                           const BoxShadow(
//                                             color: color2,
//                                             offset: Offset(-10, -10),
//                                             blurRadius: 30,
//                                           ),
//                                         ]
//                                     ),
//                                   ),
//                                   Positioned(
//                                       top: 130,
//                                       left: 30,
//                                       child: Text("Lorem ipsum",style: TextStyle(
//                                           fontWeight: FontWeight.bold
//                                       ),)),
//
//                                 ],
//                               ),
//                               decoration: BoxDecoration(
//                                   color: color2,
//                                   borderRadius: BorderRadius.circular(50),
//                                   boxShadow: [
//                                     const BoxShadow(
//                                       color: color2,
//                                       offset: Offset(10, 10),
//                                       blurRadius: 30,
//                                       spreadRadius: 1,
//                                     ),
//                                     const BoxShadow(
//                                       color: color2,
//                                       offset: Offset(-10, -10),
//                                       blurRadius: 30,
//                                       spreadRadius: 1,
//                                     ),
//                                   ]
//                               ),
//                             ),
//                           ),
//                         );
//                       }
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20,),
//               Align(
//                   alignment: Alignment.topRight,
//                   child: AppLargeText(text: "Booking",color: color1,size: 35,)),
//               SizedBox(height: 20,),
//               buildNeumorphic(),
//               buildNeumorphic(),
//               buildNeumorphic(),
//               buildNeumorphic(),
//               SizedBox(height: 20,),
//               AppLargeText(text: "Know more",color: color1,size: 35,),
//               SizedBox(height: 20,),
//               buildStack(),
//               SizedBox(height: 10,),
//               buildStack(),
//               SizedBox(height: 20,),
//               buildStack(),
//               SizedBox(height: 30,),
//               Align(
//                   alignment: Alignment.topRight,
//                   child: AppLargeText(text: "Offers",color: color1,size: 35,)),
//               SizedBox(height: 10,),
//               buildNeumorphicOffers(),
//               buildNeumorphicOffers(),
//               buildNeumorphicOffers(),
//               buildNeumorphicOffers(),
//               Container(width: width,
//                 height: 100,
//                 decoration: BoxDecoration(
//                     color: color1,
//                     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
//                   //borderRadius: BorderRadius.all(Radius.circular(20))
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Neumorphic buildNeumorphicOffers() {
//     return Neumorphic(
//       margin: EdgeInsets.all(8),
//       style: NeumorphicStyle(
//           depth: 2,
//           shadowLightColor: color3,
//           boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
//           shape: NeumorphicShape.flat,
//           color: color2
//       ),
//       child: Container(
//         margin: new EdgeInsets.only(left: 30.0),
//         width: width,
//         height: 60,
//         child: Align(
//             alignment: Alignment.centerLeft,
//             child: SimpleTextWidget(title: "Lorem ipsum" ,fontSize: 20,color: color1, fontWeight: FontWeight.bold,)),),
//     );
//   }
//
//   Stack buildStack() {
//     return Stack(
//       children: [
//         Positioned(
//           child: Container(
//             margin: EdgeInsets.only(left: 25,right: 15),
//             width: width,
//             height: 100,
//             child: Neumorphic(
//               style: NeumorphicStyle(
//                   depth: 2,
//                   shadowLightColor: color2,
//                   boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
//                   shape: NeumorphicShape.flat,
//                   color: color2
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 50,right: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     AppLargeText(text: "Lorem ipsum",color: Colors.black,size: 25,),
//                     Neumorphic(
//                         style: NeumorphicStyle(
//                             depth: 2,
//                             shadowLightColor: color3,
//                             boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
//                             shape: NeumorphicShape.flat,
//                             color: color1
//                         ),
//                         child:Container(
//                             height: 60,
//                             width: 60,
//                             child: Icon(Icons.add,color: color3,))
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 25,
//           child: Neumorphic(
//             style: NeumorphicStyle(
//                 depth: 2,
//                 shadowLightColor: color3,
//                 boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
//                 shape: NeumorphicShape.flat,
//                 color: color2
//             ),
//             child: Container(
//               width: 50,
//               height: 50,
//               color: color2,
//             ),
//           ),
//         ),
//         Positioned(
//           top: 40,
//           left: 37,
//           child: Container(
//             width: 20,
//             height: 20,
//             decoration: BoxDecoration(
//               color: color2,
//               //borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   Neumorphic buildNeumorphic() {
//     return
//       Neumorphic(
//         margin: EdgeInsets.all(8),
//         style: NeumorphicStyle(
//             depth: 2,
//             shadowLightColor: color3,
//             boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
//             shape: NeumorphicShape.flat,
//             color: color2
//         ),
//         child: Container(
//             margin: new EdgeInsets.only(left: 10.0),
//             width: width,
//             height: 60,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Neumorphic(
//                         style: NeumorphicStyle(
//                             depth: 2,
//                             shadowLightColor: color3,
//                             boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
//                             shape: NeumorphicShape.flat,
//                             color: color2
//                         ),
//                         child:Container(
//                             height: 40,
//                             width: 40,
//                             child: Text(""))
//                     ),
//                     SizedBox(width: 20,),
//                     SimpleTextWidget(title: "Lorem ipsum",fontSize: 20,color: color1, fontWeight: FontWeight.bold,),
//                   ],
//                 ),
//
//                 Row(children: [
//                   Neumorphic(
//                       style: NeumorphicStyle(
//                           depth: 2,
//                           shadowLightColor: color3,
//                           boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
//                           shape: NeumorphicShape.flat,
//                           color: color2
//                       ),
//                       child:Container(
//                           height: 30,
//                           width: 30,
//                           child: Icon(Icons.keyboard_arrow_right,color: color1,))
//                   ),
//                   SizedBox(width: 20,),
//                 ],)
//
//               ],
//
//             )),
//       );
//   }
// }