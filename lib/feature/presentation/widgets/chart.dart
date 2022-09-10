import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_algoriza/core/styles/dimensions.dart';
import 'package:weather_app_algoriza/core/utils/enums.dart';
import 'package:weather_app_algoriza/feature/domain/entity/hourly_weather_entity.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_bloc.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_state.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc,WeatherState>(
        builder: (context,state){
          switch (state.hourlyRequestState){
            case RequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.loaded:
              return Container(
                padding: EdgeInsets.all(context.height10/2),
                height: context.height20*12,
                width: context.screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.height20),
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: context.height20,
                      spreadRadius: context.height20,
                      offset: Offset(0, context.height20),
                    ),
                  ],
                ),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                    labelStyle: const TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  zoomPanBehavior: ZoomPanBehavior(
                    enablePanning: true
                  ),
                  primaryYAxis: NumericAxis(
                    labelStyle: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<HourlyWeather,String>>[
                    LineSeries<HourlyWeather,String>(
                      dataSource: state.hourlyWeather,
                      xValueMapper: (HourlyWeather weather,_) => DateFormat('h:mm a').format(DateTime.fromMillisecondsSinceEpoch(weather.time*1000,isUtc: false)),
                      yValueMapper: (HourlyWeather weather,_) => weather.temperature,

                      color: Colors.red,
                    ),
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
