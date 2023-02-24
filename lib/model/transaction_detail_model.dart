class TransactionDetail {
  static const PRODUCT_CODE = 'product_code';
  static const QUANTITY = 'quantity';
  static const SUBTOTAL = 'subtotal';
  static const CURRENCY = 'currency';
  static const PRICE = 'price';
  static const UNIT = 'unit';

  String? productCode;
  int? quantity;
  double? subtotal;
  String? currency;
  int? price;
  String? unit;

  TransactionDetail({
    required this.productCode,
    required this.quantity,
    required this.subtotal,
    required this.currency,
    required this.price,
    required this.unit,
  });

  TransactionDetail.fromMap(Map<String, dynamic> data) {
    productCode = data[PRODUCT_CODE];
    quantity = data[QUANTITY];
    price = data[PRICE];
    subtotal = data[SUBTOTAL];
    currency = data[CURRENCY];
    unit = data[UNIT];
  }

  Map toJson() => {
        PRODUCT_CODE: productCode,
        QUANTITY: quantity,
        PRICE: price,
        SUBTOTAL: price! * quantity!,
        CURRENCY: currency,
        UNIT: unit
      };
}
