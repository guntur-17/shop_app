import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:wings_test_app/instance.dart';
import 'package:wings_test_app/style/theme.dart';

import '../widget/currency.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    Widget detailItem() {
      return SizedBox(
        // height: MediaQuery.of(context).size.height * 0.5,
        child: ListView.builder(
          itemCount:
              transactionController.transaction.last.transactionDetail!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama Barang: " +
                        cartController.products.keys.toList()[index].name,
                  ),
                  Text(
                      "Kode Barang: ${transactionController.transaction.last.transactionDetail![index].productCode!}"),
                  Text(
                      "Kuantitas Barang: ${transactionController.transaction.last.transactionDetail![index].quantity!}"),
                  Text(
                      "Diskon: ${cartController.products.keys.toList()[index].discount} %"),
                  Text(
                      "Subtotal: ${CurrencyFormat.convertToIdr(transactionController.transaction.last.transactionDetail![index].subtotal!, 2)}"),
                ],
              ),
            );
          }),
        ),
      );
    }

    Widget body() {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
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
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "ID Transaksi : ${transactionController.transaction.last.documentCode!}"),
                  Text(
                      "No. Transaksi : ${transactionController.transaction.last.documentNumber!}"),
                  Text(
                      "Tanggal Transaksi : ${transactionController.transaction.last.date!}"),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Detail Barang : "),
                  SizedBox(
                    height: 12,
                  ),
                  detailItem(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Total : ${CurrencyFormat.convertToIdr(transactionController.transaction.last.total!, 2)}"),
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
