class RetailPrice {
  double? amount;
  String? currencyCode;

  RetailPrice({this.amount, this.currencyCode});

  factory RetailPrice.fromJson(Map<String, dynamic> json) => RetailPrice(
        amount: json['amount'] as double?,
        currencyCode: json['currencyCode'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currencyCode': currencyCode,
      };
}
