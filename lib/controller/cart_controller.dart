import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../instance.dart';
import '../model/product_model.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  // Add a dict to store the products in the cart.
  final _products = {}.obs;
  List<Map<String, dynamic>> transactionDetail = [];
  CollectionReference transaction = firebaseFirestore.collection('transaction');

  addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
  }

  get products => _products;

  removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  deleteProduct(Product product) {
    _products.removeWhere((key, value) => key == product);
  }

  deleteAllProducts() {
    _products.clear();
  }

  Future<void> uploadDatastore() async {
    await listingData();
    return transaction
        .add({
          'document_code': Uuid().v4().toString(),
          'document_number': Random().nextInt(9999).toString(),
          'user': FirebaseAuth.instance.currentUser!.uid,
          'total': cartController.total,
          'date': DateTime.now(),
          'transaction_detail': transactionDetail
        })
        .then((value) => print("Transaction data Added"))
        .catchError((error) => print("Transaction data couldn't be added."));
  }

  listingData() {
    for (int index = 0; index < cartController.products.keys.length; index++) {
      transactionDetail.add({
        'quantity': cartController.products.values.toList()[index],
        'product_code': cartController.products.keys.toList()[index].code,
        'currency': cartController.products.keys.toList()[index].currency,
        'price': cartController.products.keys.toList()[index].price,
        'unit': cartController.products.keys.toList()[index].unit,
        'subtotal': cartController.products.values.toList()[index] *
            cartController.products.keys.toList()[index].price *
            ((100 - cartController.products.keys.toList()[index].discount) /
                100),
      });
    }
    print(transactionDetail);
  }

  //get total price of each product
  get productSubtotal => _products.entries
      .map((product) =>
          product.key.price *
          product.value *
          ((100 - product.key.discount) / 100))
      .toList();

  //get the total of all products
  get total => productSubtotal.fold(
      0, (previousProduct, nextProduct) => previousProduct + nextProduct);
}
