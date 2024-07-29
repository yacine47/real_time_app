

import 'package:real_time_app/features/home/data/model/btc_price_model.dart';
import 'package:real_time_app/features/home/data/repos/home_repo.dart';
import 'package:real_time_app/features/home/data/services/web_socket_service.dart';

class HomeRepoImpl extends HomeRepo{
  final WebSocketService webSocketService;

  HomeRepoImpl( this.webSocketService);

  @override
  Stream<BtcPriceModel> getDataStream() {
    return webSocketService.dataStream;
  }

  @override
  void connect(String url) {
    webSocketService.connect(url);
  }

  @override
  void disconnect() {
    webSocketService.disconnect();
  }
}