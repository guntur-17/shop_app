import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String code;
  final String currency;
  final String dimension;
  final int discount;
  final String image;
  final String name;
  final int price;
  final String unit;

  Product({
    required this.code,
    required this.currency,
    required this.dimension,
    required this.discount,
    required this.image,
    required this.name,
    required this.price,
    required this.unit,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        code: snap['code'],
        currency: snap['currency'],
        dimension: snap['dimension'],
        discount: snap['discount'],
        image: snap['image'],
        name: snap['name'],
        price: snap['price'],
        unit: snap['unit']);
    return product;
  }
}
