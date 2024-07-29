

import 'package:real_time_app/features/home/data/model/btc_price_model.dart';

abstract class HomeRepo{
  Stream<BtcPriceModel> getDataStream();
  void connect(String url);
  void disconnect();
}