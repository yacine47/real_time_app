import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_time_app/features/home/data/model/btc_price_model.dart';
import 'package:real_time_app/features/home/data/repos/home_repo.dart';

part 'btc_price_state.dart';

class BtcPriceCubit extends Cubit<BtcPriceState> {
  BtcPriceCubit(this.homeRepo) : super(BtcPriceInitial()) {
    
    homeRepo.getDataStream().listen((data) {
      emit(BtcPriceSuccess(data));
    }, onError: (error) {
      emit(BtcPriceFailure('Failed to fetch data: $error'));
    });
  }
  final HomeRepo homeRepo;

    void connectWebSocket(String url) {
    homeRepo.connect(url);
  }

  void disconnectWebSocket() {
    homeRepo.disconnect();
  }
}
