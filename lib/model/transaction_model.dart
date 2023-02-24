import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wings_test_app/model/transaction_detail_model.dart';

class TransactionHeader {
  static const DOCUMENT_CODE = 'document_code';
  static const DOCUMENT_NUMBER = 'document_number';
  static const USER = 'user';
  static const TOTAL = 'total';
  static const DATE = 'date';
  static const TRANSACTIONDETAIL = 'transaction_detail';

  String? documentCode;
  String? documentNumber;
  String? user;
  double? total;
  DateTime? date;
  List<TransactionDetail>? transactionDetail;

  TransactionHeader({
    required this.documentCode,
    required this.documentNumber,
    required this.user,
    required this.total,
    required this.date,
    required this.transactionDetail,
  });

  TransactionHeader.fromSnapshot(DocumentSnapshot snap) {
    documentCode = snap[DOCUMENT_CODE];
    documentNumber = snap[DOCUMENT_NUMBER];
    user = snap[USER];
    total = snap[TOTAL].toDouble();
    date = snap[DATE].toDate();
    transactionDetail = _convertTransaction(snap[TRANSACTIONDETAIL] ?? []);
  }

  List<TransactionDetail> _convertTransaction(List transactionConv) {
    List<TransactionDetail> result = [];
    if (transactionConv.isNotEmpty) {
      for (var element in transactionConv) {
        result.add(TransactionDetail.fromMap(element));
      }
    }
    return result;
  }

  // List transactionItemtoJson() =>
  //     transactionDetail!.map((item) => item.toJson()).toList();
}
