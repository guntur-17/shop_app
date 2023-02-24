import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';
import 'package:wings_test_app/controller/cart_controller.dart';
import 'package:wings_test_app/controller/product_controller.dart';
import 'package:wings_test_app/controller/transaction_controller.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseMessaging fcm = FirebaseMessaging.instance;

ProductController productController = ProductController.instance;
CartController cartController = CartController.instance;
TransactionController transactionController = TransactionController.instance;

Logger logger = Logger();
