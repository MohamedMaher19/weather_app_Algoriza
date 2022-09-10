import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_algoriza/core/styles/dimensions.dart';
import 'package:weather_app_algoriza/core/styles/strings.dart';
import 'package:weather_app_algoriza/core/utils/enums.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_bloc.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_state.dart';


class ChosedCityHeader extends StatelessWidget {

  const ChosedCityHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc,WeatherState>(
        buildWhen: (previous, current) => previous.currentRequestStateByCity != current.currentRequestStateByCity,
        builder: (context,state){
          switch (state.currentRequestStateByCity){
            case RequestState.loading:
              return const Center();
            case RequestState.loaded:
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: context.height30, vertical: context.height30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.height30*2.5),
                    Text("${state.currentWeatherByCity!.temperature.toInt()} \u00B0",style: TextStyle(fontSize: context.height20*2.5,color: Colors.white, fontWeight: FontWeight.bold),),
                    Text('${state.currentWeatherByCity!.maxTemperature.toInt()} \u00B0/ ${state.currentWeatherByCity!.minTemperature.toInt()} \u00B0 $feelsLike ${state.currentWeatherByCity!.feelsLikeTemperature.toInt()} \u00B0',style: TextStyle(fontSize: context.height20,color: Colors.white, fontWeight: FontWeight.bold),),
                    SizedBox(height: context.height10),
                    Text('${DateFormat('EEEE').format(DateTime.now())}, ${DateFormat('h:mm a').format(DateTime.now())}',style: TextStyle(fontSize: context.height20,color: Colors.white, fontWeight: FontWeight.bold),),
                  ],
                ),
              );
            case RequestState.error:
              return Center(
                child: Text(state.currentMessage),
              );
            default:
              return const SizedBox();
          }
        });
  }
}
