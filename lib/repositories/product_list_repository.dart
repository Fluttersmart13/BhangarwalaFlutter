import 'package:flutter_demo/models/product_model.dart';
import 'package:flutter_demo/services/product_list_service.dart';

class ProductListRepository implements ProductListRepo {
  ProductListService service = ProductListService();
  ProductListRepository();
  @override
  Future<List<ProductModel>> fetchData(String category) {
    return service.fetchData(category);
  }
}

abstract class ProductListRepo {
  Future<List<ProductModel>> fetchData(String category);
}
