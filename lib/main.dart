import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wings_test_app/controller/cart_controller.dart';
import 'package:wings_test_app/controller/product_controller.dart';
import 'package:wings_test_app/controller/transaction_controller.dart';
import 'package:wings_test_app/pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(ProductController());
    Get.put(CartController());
    Get.put(TransactionController());
  });
  runApp(const GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const LoginPage(),
    );
  }
}
