import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_algoriza/core/service/service_locator.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_bloc.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_event.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/background.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/build_body.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/build_drawer.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(



        create: (BuildContext context) => sl<WeatherBloc>()
          ..add(GetCurrentWeatherEvent())
          ..add(GetDailyWeatherEvent())
          ..add(GetHourlyWeatherEvent())

        ,
        child: Scaffold(
          drawer:  BuildDrawer(),
          body: Stack(
            children: const [
              Background(),
              BuildBody()
            ],
          ),
        ));
  }
}
