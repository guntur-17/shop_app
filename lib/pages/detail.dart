import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wings_test_app/model/product_model.dart';

import '../instance.dart';
import '../style/theme.dart';
import 'cart.dart';

class DetailPage extends StatefulWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Widget body() {
      return Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff101828).withOpacity(0.1),
                  spreadRadius: -4,
                  blurRadius: 16,
                  offset: Offset(0, 12), // changes position of shadow
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    child: SizedBox(
                      width: 70,
                      child: Image.network(
                        widget.product.image,
                        width: 80,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Text(
                    widget.product.name,
                    style: trueBlackInterTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Harga : ${widget.product.price}",
                      style: trueBlackInterTextStyle.copyWith(fontSize: 12)),
                  SizedBox(
                    height: 4,
                  ),
                  Text("Dimensi : ${widget.product.dimension}",
                      style: trueBlackInterTextStyle.copyWith(fontSize: 12)),
                  SizedBox(
                    height: 4,
                  ),
                  Text("Unit : ${widget.product.unit}",
                      style: trueBlackInterTextStyle.copyWith(fontSize: 12)),
                  Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo),
                      onPressed: () {
                        cartController.addProduct(widget.product);
                        Get.snackbar(
                          'Product Added',
                          'You have added the ${widget.product.name} to your cart!',
                          messageText: Text(
                            'You have added the ${widget.product.name} to your cart!',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          snackPosition: SnackPosition.TOP,
                          duration: const Duration(seconds: 1),
                          backgroundColor: Colors.white,
                          onTap: (_) {
                            Get.to(
                              () => const CartPage(),
                              transition: Transition.cupertino,
                            );
                          },
                        );
                      },
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.1,
                        child: Center(
                          child: Text(
                            "Add to Cart",
                            style: whiteInterTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text(
            "Transaction Summary",
            style: whiteInterTextStyle.copyWith(fontSize: 16),
          ),
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
          child: Column(
            children: [body()],
          ),
        ),
      ),
    );
  }
}
