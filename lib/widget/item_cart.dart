import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wings_test_app/controller/cart_controller.dart';
import 'package:wings_test_app/model/product_model.dart';

import '../style/size_config.dart';
import '../style/theme.dart';
import 'currency.dart';

class ItemCart extends StatefulWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  const ItemCart(
      {super.key,
      required this.controller,
      required this.product,
      required this.quantity});

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: () {},
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                widget.product.image,
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
                                Text(widget.product.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: trueBlackInterTextStyle.copyWith(
                                        fontSize: 12, fontWeight: semiBold)),
                                Text(
                                    CurrencyFormat.convertToIdr(
                                        ((widget.product.price).round()), 2),
                                    overflow: TextOverflow.ellipsis,
                                    style: trueBlackInterTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: reguler,
                                        decoration:
                                            TextDecoration.lineThrough)),
                                Text(
                                    CurrencyFormat.convertToIdr(
                                        ((widget.product.price *
                                                ((100 -
                                                        widget
                                                            .product.discount) /
                                                    100))
                                            .round()),
                                        2),
                                    overflow: TextOverflow.ellipsis,
                                    style: trueBlackInterTextStyle.copyWith(
                                        fontSize: 12, fontWeight: reguler)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(Icons.chevron_left),
                            onPressed: () {
                              widget.controller.removeProduct(widget.product);
                            }),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('${widget.quantity}'),
                        ),
                        IconButton(
                            icon: Icon(Icons.chevron_right),
                            onPressed: () {
                              widget.controller.addProduct(widget.product);
                            }),
                      ],
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
