import 'package:get/get.dart';
import 'package:wings_test_app/model/transaction_model.dart';
import 'package:wings_test_app/services/transaction_service.dart';

class TransactionController extends GetxController {
  static TransactionController instance = Get.find();
  final transaction = <TransactionHeader>[].obs;

  @override
  void onInit() {
    transaction.bindStream(FirestoreTransaction().getAllTransaction());
    super.onInit();
  }
}
