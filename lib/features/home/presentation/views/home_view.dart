import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_app/features/home/data/repos/home_repo_impl.dart';
import 'package:real_time_app/features/home/data/services/web_socket_service.dart';
import 'package:real_time_app/features/home/presentation/view_models/btc_price_cubit.dart';
import 'package:real_time_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (context) => BtcPriceCubit(HomeRepoImpl(WebSocketService()))
          ..connectWebSocket(
              'wss://stream.binance.com:9443/ws/btcusdt@trade'),
        child: const HomeViewBody(),
      )),
    );
  }
}
