import 'package:flutter_demo/models/product_model.dart';

abstract class ProductListState{} // this class is not going to use

class InitialProductListState extends ProductListState{}

class LoadedProductListState extends ProductListState{
  final List<ProductModel> data;
  LoadedProductListState({required this.data});
}

class ErrorProductListState extends ProductListState{
  final String error;
  ErrorProductListState({required this.error});
}

class AlreadyAdded extends ProductListState{}