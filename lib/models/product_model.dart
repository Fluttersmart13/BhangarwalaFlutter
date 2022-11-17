import 'dart:convert';

/// iid : "1"
/// item_name : "News Papers"
/// categories : "papers"
/// unit : "kg"
/// price : "7"
/// image : "http://www.gravityclasses.co.in/bhangarwala/icons/news_paper.png"

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    String? iid,
    String? itemname,
    String? categories,
    String? unit,
    String? price,
    String? image,
    String? quantity,
  }) {
    _iid = iid;
    _itemname = _itemname;
    _categories = categories;
    _unit = unit;
    _price = price;
    _image = image;
    _quantity = quantity;
  }

  ProductModel.fromJson(dynamic json) {
    _iid = json['iid'];
    _itemname = json['item_name'];
    _categories = json['categories'];
    _unit = json['unit'];
    _price = json['price'];
    _image = json['image'];
    _quantity = json['quantity'] ?? "1";
  }
  String? _iid;
  String? _itemname;
  String? _categories;
  String? _unit;
  String? _price;
  String? _image;
  String? _quantity;
  ProductModel copyWith({
    String? iid,
    String? itemname,
    String? categories,
    String? unit,
    String? price,
    String? image,
    String? quantity,
  }) =>
      ProductModel(
        iid: iid ?? _iid,
        itemname: _itemname ?? _itemname,
        categories: categories ?? _categories,
        unit: unit ?? _unit,
        price: price ?? _price,
        image: image ?? _image,
        quantity: image ?? _quantity,
      );
  String? get iid => _iid;
  String? get itemname => _itemname;
  String? get categories => _categories;
  String? get unit => _unit;
  String? get price => _price;
  String? get image => _image;
  String? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iid'] = _iid;
    map['item_name'] = _itemname;
    map['categories'] = _categories;
    map['unit'] = _unit;
    map['price'] = _price;
    map['image'] = _image;
    map['quantity'] = _quantity;
    return map;
  }
}
