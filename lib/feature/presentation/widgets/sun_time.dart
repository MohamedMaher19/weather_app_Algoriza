import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_algoriza/core/styles/dimensions.dart';
import 'package:weather_app_algoriza/core/styles/images.dart';
import 'package:weather_app_algoriza/core/utils/enums.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_bloc.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_state.dart';


class SunTime extends StatelessWidget {
  const SunTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      switch (state.currentRequestState) {
        case RequestState.loading:
          return const Center();
        case RequestState.loaded:
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: context.height20, vertical: context.height10),
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
                    Text(
                      'Sunrise',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.height20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: context.height10/2),
                    Text(
                      DateFormat('h:mm a').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              state.currentWeather!.sunrise * 1000)),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.height20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    LottieBuilder.asset(
                      sunrise,
                      height: context.height30*3,
                      width: context.height30*5,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Sunset',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.height20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: context.height10/2),
                    Text(
                      DateFormat('h:mm a').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              state.currentWeather!.sunset * 1000)),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.height20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    LottieBuilder.asset(
                      sunset,
                      height: context.height30*3,
                      width: context.height30*5,
                    )
                  ],
                )
              ],
            ),
          );
        case RequestState.error:
          return const Center(child: Text('Error'));
        default:
          return const SizedBox();
      }
    });
  }
}
