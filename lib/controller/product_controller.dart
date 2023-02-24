import 'package:get/get.dart';
import 'package:wings_test_app/model/product_model.dart';
import 'package:wings_test_app/services/product_service.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  final products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(FirestoreProduct().getAll());
    super.onInit();
  }
}
