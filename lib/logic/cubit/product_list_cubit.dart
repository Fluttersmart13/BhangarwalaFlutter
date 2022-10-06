import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/logic/states/product_list_state.dart';
import '../../models/product_model.dart';
import '../../repositories/product_list_repository.dart';

class ProductListCubit extends Cubit<ProductListState>{
  final ProductListRepo _productListRepo;
  ProductListCubit(this._productListRepo) : super (InitialProductListState());

  Future<void> getData() async {
    List<ProductModel> data;
    try {
      data = await _productListRepo.fetchData();
      emit(LoadedProductListState(data: data));
    } on Exception {
      emit(ErrorProductListState(error: "Could not fetch the list, please try again later!"));
    }
  }
}