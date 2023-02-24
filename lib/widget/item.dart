import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wings_test_app/instance.dart';
import 'package:wings_test_app/pages/cart.dart';
import 'package:wings_test_app/pages/detail.dart';
import 'package:wings_test_app/style/theme.dart';
import 'package:wings_test_app/widget/currency.dart';

import '../model/product_model.dart';
import '../style/size_config.dart';

class ItemWidget extends StatelessWidget {
  final Product product;
  const ItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: () {
        Get.to(() => DetailPage(product: product));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff101828).withOpacity(0.1),
                spreadRadius: -4,
                blurRadius: 16,
                offset: Offset(0, 12), // changes position of shadow
              ),
            ],
          ),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12)),
                            child: SizedBox(
                              width: 70,
                              child: Image.network(
                                product.image,
                                width: 80,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(product.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: trueBlackInterTextStyle.copyWith(
                                        fontSize: 14, fontWeight: semiBold)),
                                Text(
                                    CurrencyFormat.convertToIdr(
                                        ((product.price).round()), 2),
                                    overflow: TextOverflow.ellipsis,
                                    style: trueBlackInterTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: reguler,
                                        decoration:
                                            TextDecoration.lineThrough)),
                                Text(
                                    CurrencyFormat.convertToIdr(
                                        ((product.price *
                                                ((100 - product.discount) /
                                                    100))
                                            .round()),
                                        2),
                                    overflow: TextOverflow.ellipsis,
                                    style: trueBlackInterTextStyle.copyWith(
                                        fontSize: 14, fontWeight: reguler)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        cartController.addProduct(product);
                        Get.snackbar(
                          'Product Added',
                          'You have added the ${product.name} to your cart!',
                          messageText: Text(
                            'You have added the ${product.name} to your cart!',
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
                      child: Icon(Icons.add_shopping_cart_outlined),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
