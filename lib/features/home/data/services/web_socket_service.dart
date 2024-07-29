import 'dart:async';
import 'dart:convert';

import 'package:real_time_app/features/home/data/model/btc_price_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketService {
  late WebSocketChannel channel;
  final StreamController<BtcPriceModel> _streamController =
      StreamController<BtcPriceModel>();

  Stream<BtcPriceModel> get dataStream => _streamController.stream;

  void connect(String url) {
    channel = WebSocketChannel.connect(Uri.parse(url));

    channel.stream.listen((message) {
      Map<String, dynamic> jsonResponse = json.decode(message);
      BtcPriceModel data = BtcPriceModel.fromJson(jsonResponse);
      _streamController.add(data); // Add data to the stream
    }, onDone: () {
      print('WebSocket connection closed');
      _streamController.close(); // Close the stream when done
    }, onError: (error) {
      print('WebSocket error: $error');
      _streamController.addError(error); // Add error to the stream
    });
  }

  void disconnect() {
    channel.sink.close(status.goingAway);
  }
}


// wss://stream.binance.com:9443/ws/btcusdt@trade