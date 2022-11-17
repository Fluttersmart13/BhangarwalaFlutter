import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/states/product_list_state.dart';
import 'package:flutter_demo/moordb/database_helpers.dart';

import '../../models/product_model.dart';
import '../../repositories/product_list_repository.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final ProductListRepo _productListRepo;
  final _databaseInstance = AppDatabase.sharedInstance;
  final cartStreamController = StreamController.broadcast();
  final quantityStreamController = StreamController.broadcast();
  late List<ProductModel> data;
  Stream get getStream => cartStreamController.stream;
  Stream get getQuantityStream => quantityStreamController.stream;
  late List<ProductModel> cartList = [];
  late int quantity = 1;

  ///late is use to initialize after its avoid null point exception
  late ProductModel selecteProduct;
  int totalAmount = 0;
  ProductListCubit(this._productListRepo) : super(InitialProductListState()) {
    getAllProducts();
  }
  Future<void> getData(String category) async {
    try {
      data = await _productListRepo.fetchData(category);
      emit(LoadedProductListState(data: data));
    } on Exception {
      emit(ErrorProductListState(
          error: "Could not fetch the list, please try again later!"));
    }
  }

  void addToCart(ProductModel item) {
    if (!cartList.any((item1) => item1.iid == item.iid)) {
      final dbProduct = DBProduct(
          iid: item.iid!,
          item_name: item.itemname!,
          categories: item.categories!,
          unit: item.unit!,
          price: item.price!,
          image: item.image!,
          quantity: item.quantity!);
      ProductsDao(_databaseInstance).addProduct(dbProduct);
    } else {
      ProductsDao(_databaseInstance).deleteProduct(iid: item.iid!);
    }
    getAllProducts();
  }

  void incrementQuantity(ProductModel item) {
    quantity = quantity + 1;
    updateProduct(item.iid, "$quantity");
    quantityStreamController.sink.add(quantity);
    getAllProducts();
  }

  void decrementQuantity(ProductModel item) {
    if (quantity > 1) {
      quantity = quantity - 1;
      updateProduct(item.iid, "$quantity");
      quantityStreamController.sink.add(quantity);
      getAllProducts();
    }
  }

  void updateProduct(iid, quantity) {
    ProductsDao(_databaseInstance).updateProduct(iid: iid, quantity: quantity);
  }

  void selectedProduct(ProductModel item) {
    quantity = int.parse(item.quantity!);
    quantityStreamController.sink.add(quantity);
    selecteProduct = item;
  }

  Future<void> removeFromCart(item) async {
    await ProductsDao(_databaseInstance)
        .deleteProduct(iid: item.iid.toString());
    getAllProducts();
  }

  Future<List<DBProduct>> getAllProducts() async {
    final dbProducts = await ProductsDao(_databaseInstance).getProduct();
    print(jsonEncode(dbProducts));

    cartList.clear();
    cartList.addAll(
        (jsonDecode(jsonEncode(dbProducts).toString()) as List<dynamic>)
            .map((e) => ProductModel.fromJson(e))
            .toList());

    print("cart_list${cartList.length}");
    for (var element in cartList) {
      totalAmount = totalAmount + int.parse(element.quantity!);
    }
    cartStreamController.sink.add(cartList);
    return dbProducts;
  }

  int getTotalAmount() {
    int quantity = 0;
    for (var element in cartList) {
      quantity =
          quantity + (int.parse(element.quantity!) * int.parse(element.price!));
    }
    return quantity;
  }
}

final bloc = ProductListCubit(ProductListRepository());
