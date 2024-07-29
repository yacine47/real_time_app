class BtcPriceModel {
  final String price;

  BtcPriceModel({required this.price});

  factory BtcPriceModel.fromJson(Map<String, dynamic> data) {
    return BtcPriceModel(price: data['p']);
  }
}
