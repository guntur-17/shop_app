import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wings_test_app/instance.dart';
import 'package:wings_test_app/pages/summary.dart';
import 'package:wings_test_app/style/theme.dart';
import 'package:wings_test_app/widget/item_cart.dart';

import '../widget/currency.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Widget body() {
      return Obx(
        () => SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: ListView.builder(
            itemCount: cartController.products.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              return ItemCart(
                controller: cartController,
                product: cartController.products.keys.toList()[index],
                quantity: cartController.products.values.toList()[index],
              );
            }),
          ),
        ),
      );
    }

    Widget checkout() {
      return Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: trueBlackInterTextStyle.copyWith(fontSize: 14),
                ),
                Obx(
                  () => Text(
                    CurrencyFormat.convertToIdr(cartController.total, 2),
                    style: trueBlackInterTextStyle.copyWith(fontSize: 14),
                  ),
                )
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                onPressed: () {
                  cartController.uploadDatastore();
                  Get.to(() => SummaryPage());
                },
                child: Container(
                  // width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.1,
                  child: Center(
                    child: Text(
                      "Checkout",
                      style: whiteInterTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                )),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text(
            "Cart",
            style: whiteInterTextStyle.copyWith(fontSize: 16),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 75.0),
          child: FloatingActionButton.small(
            onPressed: () {
              cartController.deleteAllProducts();
            },
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.delete),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: LayoutBuilder(
          builder: (context, constraint) {
            return Form(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: <Widget>[body(), Spacer(), checkout()],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
