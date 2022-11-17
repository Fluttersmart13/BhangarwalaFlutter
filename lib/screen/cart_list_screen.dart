import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/logic/cubit/product_list_cubit.dart';
import 'package:flutter_demo/route/router_constants.dart';
import 'package:flutter_demo/widgets/text_widgets.dart';

import '../constants/constants.dart';
import '../widgets/app_bar.dart';
import 'cart_bottom_nav_bar.dart';

class CartListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ItemAppBar(
              isBackpress: true,
              isCart: false,
              cartCount: 0,
              onclick: () {},
              backpress: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              flex: 9,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                      color: color2,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: StreamBuilder(
                    stream: bloc.getStream,
                    initialData: bloc.cartList,
                    builder: (context, snapshot) {
                      return snapshot.data.length > 0
                          ? ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    bloc.selectedProduct(snapshot.data[index]);
                                    Navigator.pushNamed(context, routeCartItem,
                                        arguments: "soni");
                                  },
                                  child: Container(
                                    height: 110,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ///radio section
                                        Row(
                                          children: [
                                            Radio(
                                                activeColor: color1,
                                                value: "",
                                                groupValue: "",
                                                onChanged: (index) {}),

                                            ///product image
                                            Container(
                                                height: 50,
                                                width: 50,
                                                margin: const EdgeInsets.only(
                                                    right: 15),
                                                child: Image.network(snapshot
                                                    .data[index].image!!)),

                                            ///product title with prize
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SimpleTextWidget(
                                                      title:
                                                          "${snapshot.data[index].itemname.toString()}",
                                                      fontSize: 24,
                                                      color: color1,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  SimpleTextWidget(
                                                      title:
                                                          "${snapshot.data[index].price} ₹ / kg",
                                                      fontSize: 20,
                                                      color: textColor,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                  SimpleTextWidget(
                                                      title:
                                                          "Total Qty : ${snapshot.data[index].quantity} Kg",
                                                      fontSize: 12,
                                                      color: textColor,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                        ///delete button
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  bloc.removeFromCart(
                                                      snapshot.data[index]);
                                                },
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                  size: 30,
                                                ),
                                              ),
                                              SimpleTextWidget(
                                                  title:
                                                      "${int.parse(snapshot.data[index].quantity) * int.parse(snapshot.data[index].price)} ₹ ",
                                                  fontSize: 16,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.normal)

                                              // Row(
                                              //   children: [
                                              //     Container(
                                              //       padding:
                                              //           const EdgeInsets.all(5),
                                              //       decoration: BoxDecoration(
                                              //           color: Colors.white,
                                              //           borderRadius:
                                              //               BorderRadius
                                              //                   .circular(20),
                                              //           boxShadow: [
                                              //             BoxShadow(
                                              //                 color: Colors.grey
                                              //                     .withOpacity(
                                              //                         0.5),
                                              //                 spreadRadius: 3,
                                              //                 blurRadius: 10,
                                              //                 offset:
                                              //                     const Offset(
                                              //                         0, 3))
                                              //           ]),
                                              //       child: const Icon(
                                              //         CupertinoIcons.minus,
                                              //         size: 18,
                                              //       ),
                                              //     ),
                                              //     const Padding(
                                              //       padding:
                                              //           EdgeInsets.all(8.0),
                                              //       child: Text("11"),
                                              //     ),
                                              //     Container(
                                              //       padding:
                                              //           const EdgeInsets.all(5),
                                              //       decoration: BoxDecoration(
                                              //           color: Colors.white,
                                              //           borderRadius:
                                              //               BorderRadius
                                              //                   .circular(20),
                                              //           boxShadow: [
                                              //             BoxShadow(
                                              //                 color: Colors.grey
                                              //                     .withOpacity(
                                              //                         0.5),
                                              //                 spreadRadius: 3,
                                              //                 blurRadius: 10,
                                              //                 offset:
                                              //                     const Offset(
                                              //                         0, 3))
                                              //           ]),
                                              //       child: const Icon(
                                              //         CupertinoIcons.plus,
                                              //         size: 18,
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: SimpleTextWidget(
                              title: "You haven't added any item yet",
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: color1,
                            ));
                    },
                  )),
            )
          ],
        ),
        bottomNavigationBar: CartBottomNavBar(),
      ),
    );
  }
}
