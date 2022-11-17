import 'dart:convert';

import 'package:flutter_demo/models/categories_model.dart';

class CategoriesRepository {
  late CategoriesModel _data = CategoriesModel();

  Future<CategoriesModel> fetchData() async {
    var data = json.decode(
        '{"category": [{ "key": "newspaper", "value": "NewsPaper", "image_url": "assets/images/news_paper.png" }, { "key": "bottles", "value": "Bottles", "image_url": "assets/images/plastic_bottle.png" }, { "key": "Metals", "value": "Metals", "image_url": "assets/images/iron.png" }, { "key": "Download Report", "value": "Computers", "image_url": "assets/images/computer.png" },{ "key": "book", "value": "Books", "image_url": "assets/images/books_scrap.png" },{ "key": "olditems", "value": "Old Items", "image_url": "assets/images/old_items.png" }]}');
    _data = CategoriesModel.fromJson(data);

    return _data;
  }

  CategoriesModel get data => _data;
}
