import 'dart:convert';

/// category : [{"key":"newspaper","value":"NewsPaper","image_url":"assets/images/news_paper.png"},{"key":"bottles","value":"Bottles","image_url":"assets/images/plastic_bottle.png"},{"key":"Metals","value":"Metals","image_url":"assets/images/iron.png"},{"key":"Download Report","value":"Computers","image_url":"assets/images/computer.png"},{"key":"book","value":"Books","image_url":"assets/images/books_scrap.png"},{"key":"olditems","value":"Old Items","image_url":"assets/images/old_items.png"}]

CategoriesModel categoriesModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));
String categoriesModelToJson(CategoriesModel data) =>
    json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
    List<Category>? category,
  }) {
    _category = category;
  }

  CategoriesModel.fromJson(dynamic json) {
    if (json['category'] != null) {
      _category = [];
      json['category'].forEach((v) {
        _category?.add(Category.fromJson(v));
      });
    }
  }
  List<Category>? _category;
  CategoriesModel copyWith({
    List<Category>? category,
  }) =>
      CategoriesModel(
        category: category ?? _category,
      );
  List<Category>? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_category != null) {
      map['category'] = _category?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// key : "newspaper"
/// value : "NewsPaper"
/// image_url : "assets/images/news_paper.png"

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));
String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    String? key,
    String? value,
    String? imageUrl,
  }) {
    _key = key;
    _value = value;
    _imageUrl = imageUrl;
  }

  Category.fromJson(dynamic json) {
    _key = json['key'];
    _value = json['value'];
    _imageUrl = json['image_url'];
  }
  String? _key;
  String? _value;
  String? _imageUrl;
  Category copyWith({
    String? key,
    String? value,
    String? imageUrl,
  }) =>
      Category(
        key: key ?? _key,
        value: value ?? _value,
        imageUrl: imageUrl ?? _imageUrl,
      );
  String? get key => _key;
  String? get value => _value;
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = _key;
    map['value'] = _value;
    map['image_url'] = _imageUrl;
    return map;
  }
}
