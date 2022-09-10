import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_algoriza/core/styles/dimensions.dart';
import 'package:weather_app_algoriza/core/styles/images.dart';
import 'package:weather_app_algoriza/core/utils/enums.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_bloc.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_state.dart';


class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      switch (state.currentRequestState) {
        case RequestState.loading:
          return const Center();
        case RequestState.loaded:
          return Container(
            padding: EdgeInsets.symmetric(horizontal: context.height20, vertical: context.height10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(context.height10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, context.height10),
                  blurRadius: context.height10,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    LottieBuilder.asset(wind, height: context.height30*3,width: context.height30*5,),
                    SizedBox(height: context.height10),
                    Text(
                      'Wind',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.height20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: context.height10 / 2),
                    Text(
                      '${state.currentWeather!.windspeed} m/s',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: context.height20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    LottieBuilder.asset(humidity, height: context.height30*3,width: context.height30*5,),
                    SizedBox(height: context.height10),
                    Text(
                      'Humidity',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.height20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: context.height10 / 2),
                    Text(
                      '${state.currentWeather!.humidity} %',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: context.height20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        case RequestState.error:
          return Text(state.currentMessage);
        default:
          return const SizedBox();
      }
    });
  }
}
