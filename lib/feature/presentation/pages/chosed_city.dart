import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_algoriza/core/service/service_locator.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_bloc.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_event.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/build_drawer.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/chosed_city/chosed_background.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/chosed_city/chosed_build_body.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/chosed_city/chosed_build_drawer.dart';


class ChosedCity extends StatelessWidget {
  String cityName;
   ChosedCity(  {Key? key, required this.cityName }) : super(key: key);


  // String? cityName;



  @override
  Widget build(BuildContext context) {
    return BlocProvider(




        create: (BuildContext context) => sl<WeatherBloc>()
          ..add(GetCurrentWeatherByCityEvent(cityName))
          ..add(GetCurrentWeatherEvent())
          // ..add(GetDailyWeatherEvent())
          // ..add(GetHourlyWeatherEvent())
           ..add(GetDailyWeatherWithCityNameEvent(cityName))
          ..add(GetHourlyWeatherForChosedCityEvent())

        ,
        child: Scaffold(
          drawer:  BuildDrawer(),
          body: Stack(
            children: const [
              ChosedBackground(),
              ChosedBuildBody()
            ],
          ),
        ));
  }
}
