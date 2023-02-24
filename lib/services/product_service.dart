import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wings_test_app/model/product_model.dart';

class FirestoreProduct {
  Stream<List<Product>> getAll() {
    return FirebaseFirestore.instance
        .collection("product")
        .snapshots()
        .map((event) {
      return event.docs.map((e) => Product.fromSnapshot(e)).toList();
    });
  }
}
