import 'dart:convert';
/// iid : "1"
/// item_name : "News Papers"
/// categories : "papers"
/// unit : "kg"
/// price : "7"
/// image : "http://www.gravityclasses.co.in/bhangarwala/icons/news_paper.png"

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());
class ProductModel {
  ProductModel({
      String? iid, 
      String? itemName, 
      String? categories, 
      String? unit, 
      String? price, 
      String? image,}){
    _iid = iid;
    _itemName = itemName;
    _categories = categories;
    _unit = unit;
    _price = price;
    _image = image;
}

  ProductModel.fromJson(dynamic json) {
    _iid = json['iid'];
    _itemName = json['item_name'];
    _categories = json['categories'];
    _unit = json['unit'];
    _price = json['price'];
    _image = json['image'];
  }
  String? _iid;
  String? _itemName;
  String? _categories;
  String? _unit;
  String? _price;
  String? _image;
ProductModel copyWith({  String? iid,
  String? itemName,
  String? categories,
  String? unit,
  String? price,
  String? image,
}) => ProductModel(  iid: iid ?? _iid,
  itemName: itemName ?? _itemName,
  categories: categories ?? _categories,
  unit: unit ?? _unit,
  price: price ?? _price,
  image: image ?? _image,
);
  String? get iid => _iid;
  String? get itemName => _itemName;
  String? get categories => _categories;
  String? get unit => _unit;
  String? get price => _price;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iid'] = _iid;
    map['item_name'] = _itemName;
    map['categories'] = _categories;
    map['unit'] = _unit;
    map['price'] = _price;
    map['image'] = _image;
    return map;
  }

}