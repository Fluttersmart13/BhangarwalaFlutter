import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/constants/constants.dart';
import 'package:flutter_demo/logic/cubit/product_list_cubit.dart';
import 'package:flutter_demo/logic/states/product_list_state.dart';
import 'package:flutter_demo/widgets/text_widgets.dart';

import '../route/router_constants.dart';
import '../widgets/app_bar.dart';

class ProductListScreen extends StatelessWidget {
  String category;
  ProductListScreen({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            StreamBuilder(
                stream: bloc.getStream,
                builder: (context, snapshot) {
                  int cartCount = 0;
                  if (snapshot.hasData) {
                    cartCount = snapshot.data.length;
                  }
                  return ItemAppBar(
                    cartCount: cartCount,
                    onclick: () {
                      Navigator.pushNamed(context, routeCartList);
                    },
                    backpress: () {
                      Navigator.pop(context);
                    },
                    isCart: true,
                    isBackpress: true,
                  );
                }),
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
                  child: BlocBuilder<ProductListCubit, ProductListState>(
                    builder: (context, state) {
                      if (state is InitialProductListState) {
                        context.read<ProductListCubit>().getData(category);
                        return const Center(
                            child: CircularProgressIndicator(
                          color: color1,
                        ));
                      } else if (state is ErrorProductListState) {
                        return Center(child: Text(state.error));
                      } else if (state is LoadedProductListState) {
                        return StreamBuilder(
                            initialData: state.data,
                            stream: bloc.getStream,
                            builder: (context, snapshot) {
                              return ListView.builder(
                                itemCount: state.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ListTile(
                                        title: SimpleTextWidget(
                                          title: state.data[index].itemname!,
                                          fontSize: 24,
                                          color: color1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        subtitle: SimpleTextWidget(
                                            title:
                                                "${state.data[index].price} ₹ / kg",
                                            fontSize: 14,
                                            color: textColor,
                                            fontWeight: FontWeight.normal),
                                        leading: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: color3),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CachedNetworkImage(
                                                imageUrl: state
                                                    .data[index].image
                                                    .toString(),
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator(
                                                        color: color1),
                                              ),
                                            )),
                                        trailing: Checkbox(
                                          value: (bloc.cartList.any((item) =>
                                                  item.iid ==
                                                  state.data[index].iid))
                                              ? true
                                              : false,
                                          onChanged: (bool? value) {
                                            bloc.addToCart(state.data[index]);
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            });
                      } else {
                        return Container();
                      }
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
