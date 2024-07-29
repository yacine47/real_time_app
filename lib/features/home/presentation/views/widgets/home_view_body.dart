import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:real_time_app/features/home/presentation/view_models/btc_price_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<BtcPriceCubit, BtcPriceState>(
            builder: (context, state) {
              if (state is BtcPriceSuccess) {
                return Text(
                    'The BTC-USDT Price is ${state.btcPriceModel.price}');
              } else if (state is BtcPriceFailure) {
                return Text(state.errrMessage);
              }
              return const CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}
