part of 'btc_price_cubit.dart';

@immutable
abstract class BtcPriceState {}

class BtcPriceInitial extends BtcPriceState {}

class BtcPriceLoading extends BtcPriceState {}

class BtcPriceSuccess extends BtcPriceState {
  final BtcPriceModel btcPriceModel;

  BtcPriceSuccess(this.btcPriceModel);
}

class BtcPriceFailure extends BtcPriceState {
  final String errrMessage;

  BtcPriceFailure(this.errrMessage);
  
}
