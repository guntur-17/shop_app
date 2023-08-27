import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wings_test_app/instance.dart';
import 'package:wings_test_app/style/theme.dart';
import 'package:wings_test_app/widget/item.dart';

import 'cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Item List',
            style: whiteRobotoTextStyle.copyWith(fontSize: 18),
          ),
          backgroundColor: Colors.deepPurple,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  Get.to(() => const CartPage());
                },
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [body()]),
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Obx(
      () => Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: ListView.builder(
          itemCount: productController.products.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: ((context, index) {
            final products = productController.products[index];
            return ItemWidget(
              product: products,
            );
          }),
        ),
      ),
    );
  }
}
