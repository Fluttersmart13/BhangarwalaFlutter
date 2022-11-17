import 'dart:convert';

import 'package:flutter_demo/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductListService {
  Future<List<ProductModel>> fetchData(String category) async {
    var map = new Map<String, dynamic>();
    map['categories'] = category;
    http.Response response = await http.post(
        Uri.parse('http://gravityclasses.co.in/bhangarwala/get_products.php'),
        body: map);
    if (response.statusCode == 200) {
      String responseData = response.body.toString();
      //String responseData = '[{ "iid": "1", "item_name": "product 1", "categories": "papers", "unit": "kg", "price": "7", "image": "http://www.gravityclasses.co.in/bhangarwala/icons/news_paper.png" }, { "iid": "2", "item_name": "product 2", "categories": "papers", "unit": "kg", "price": "4", "image": "http://www.gravityclasses.co.in/bhangarwala/icons/card_board.png" }, { "iid": "3", "item_name": "product 3", "categories": "papers", "unit": "kg", "price": "5", "image": "http://www.gravityclasses.co.in/bhangarwala/icons/box_png.png" }, { "iid": "4", "item_name": "product 4", "categories": "papers", "unit": "kg", "price": "7", "image": "http://www.gravityclasses.co.in/bhangarwala/icons/exam_papers.png" }, { "iid": "5", "item_name": "product 4", "categories": "papers", "unit": "kg", "price": "7", "image": "http://www.gravityclasses.co.in/bhangarwala/icons/exam_papers.png" } ]';
      return (jsonDecode(responseData.toString()) as List<dynamic>)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
