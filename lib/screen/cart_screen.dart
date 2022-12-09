import 'package:cached_network_image/cached_network_image.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/constants.dart';
import 'package:flutter_demo/logic/cubit/product_list_cubit.dart';
import 'package:flutter_demo/widgets/app_bar.dart';
import 'package:flutter_demo/widgets/text_widgets.dart';

class CartItemScreen extends StatelessWidget {
  const CartItemScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: color2,
        child: ListView(
          children: [
            ItemAppBar(
              isCart: false,
              cartCount: 0,
              onclick: () {},
              backpress: () {
                Navigator.pop(context);
              },
              isBackpress: true,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                  height: MediaQuery.of(context).size.width * 0.70,
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl: bloc.selecteProduct.image.toString(),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(color: color1),
                  )),
            ),
            Arc(
                edge: Edge.TOP,
                height: 30,
                arcType: ArcType.CONVEY,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        /// product title
                        Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SimpleTextWidget(
                                  title: bloc.selecteProduct.itemname!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: TEXT_LABEL),
                              // InkWell(
                              //   onTap: () {
                              //     bloc.removeFromCart(snapshot.data[0]);
                              //   },
                              //   child: const Icon(
                              //     Icons.delete,
                              //     color: Colors.red,
                              //     size: 30,
                              //   ),
                              // ),
                            ],
                          ),
                        ),

                        ///description
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "A simple yet fully customizable rating bar for flutter which also include a rating bar indicator, supporting any fraction of rating.",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),

                        ///star and increment
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // RatingBar.builder(
                              //   initialRating: 3,
                              //   minRating: 1,
                              //   direction: Axis.horizontal,
                              //   allowHalfRating: true,
                              //   itemCount: 5,
                              //   itemSize: 20,
                              //   itemPadding:
                              //       EdgeInsets.symmetric(horizontal: 0.0),
                              //   itemBuilder: (context, _) => Icon(
                              //     Icons.star,
                              //     size: 2,
                              //     color: color1,
                              //   ),
                              //   onRatingUpdate: (rating) {
                              //     print(rating);
                              //   },
                              // ),

                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child:
                                    Text("${bloc.selecteProduct.price} ₹ / kg"),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      bloc.decrementQuantity(
                                          bloc.selecteProduct);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 3,
                                                blurRadius: 10,
                                                offset: const Offset(0, 3))
                                          ]),
                                      child: const Icon(CupertinoIcons.minus),
                                    ),
                                  ),
                                  StreamBuilder(
                                      stream: bloc.getQuantityStream,
                                      initialData: bloc.quantity,
                                      builder: (context, quantitySnap) {
                                        print(quantitySnap);
                                        return Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child:
                                              Text("${quantitySnap.data} kg"),
                                        );
                                      }),
                                  InkWell(
                                    onTap: () {
                                      bloc.incrementQuantity(
                                          bloc.selecteProduct);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 3,
                                                blurRadius: 10,
                                                offset: const Offset(0, 3))
                                          ]),
                                      child: const Icon(CupertinoIcons.add),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // RatingBar.builder(
                              //   initialRating: 3,
                              //   minRating: 1,
                              //   direction: Axis.horizontal,
                              //   allowHalfRating: true,
                              //   itemCount: 5,
                              //   itemSize: 20,
                              //   itemPadding:
                              //       EdgeInsets.symmetric(horizontal: 0.0),
                              //   itemBuilder: (context, _) => Icon(
                              //     Icons.star,
                              //     size: 2,
                              //     color: color1,
                              //   ),
                              //   onRatingUpdate: (rating) {
                              //     print(rating);
                              //   },
                              // ),

                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                    "${bloc.selecteProduct.price} ₹ / 2 kg"),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      bloc.decrementQuantity(
                                          bloc.selecteProduct);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 3,
                                                blurRadius: 10,
                                                offset: const Offset(0, 3))
                                          ]),
                                      child: const Icon(CupertinoIcons.minus),
                                    ),
                                  ),
                                  StreamBuilder(
                                      stream: bloc.getQuantityStream,
                                      initialData: bloc.quantity,
                                      builder: (context, quantitySnap) {
                                        print(quantitySnap);
                                        return Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child:
                                              Text("${quantitySnap.data} kg"),
                                        );
                                      }),
                                  InkWell(
                                    onTap: () {
                                      bloc.incrementQuantity(
                                          bloc.selecteProduct);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 3,
                                                blurRadius: 10,
                                                offset: const Offset(0, 3))
                                          ]),
                                      child: const Icon(CupertinoIcons.add),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        ///Total
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("Total"),
                              ),
                              StreamBuilder(
                                  stream: bloc.getQuantityStream,
                                  initialData: bloc.quantity,
                                  builder: (context, snapshotTotal) {
                                    return SimpleTextWidget(
                                        title:
                                            "${(int.parse(bloc.selecteProduct.price!)) * snapshotTotal.data} ₹",
                                        fontSize: 24,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.red);
                                  })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
