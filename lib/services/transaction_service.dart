import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wings_test_app/model/transaction_model.dart';

class FirestoreTransaction {
  Stream<List<TransactionHeader>> getAllTransaction() {
    return FirebaseFirestore.instance
        .collection("transaction")
        .snapshots()
        .map((event) {
      return event.docs.map((e) => TransactionHeader.fromSnapshot(e)).toList();
    });
  }
}
