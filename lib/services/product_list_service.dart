import 'dart:convert';

import 'package:flutter_demo/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductListService {
  Future<List<ProductModel>> fetchData() async {
    var map = new Map<String, dynamic>();
    map['categories'] = 'bottles';
    http.Response response = await http.post(Uri.parse('http://gravityclasses.co.in/bhangarwala/get_products.php'),body:map);
    if (response.statusCode == 200) {
      String responseData = response.body.toString();
      return (jsonDecode(responseData.toString()) as List<dynamic>).map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

}