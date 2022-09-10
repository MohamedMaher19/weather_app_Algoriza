import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_algoriza/core/network/api_constance.dart';
import 'package:weather_app_algoriza/core/styles/dimensions.dart';
import 'package:weather_app_algoriza/core/utils/enums.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_bloc.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_state.dart';


class TimeTable extends StatelessWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc,WeatherState>(
        builder: (context,state){
          switch (state.dailyRequestState){
            case RequestState.loading:
              return const Center();
            case RequestState.loaded:
              return Container(
                padding: EdgeInsets.symmetric(vertical: context.height20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(context.height20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: context.height30,
                      spreadRadius: context.height30,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    for(final weather in state.dailyWeather)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.height20,vertical: context.height10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    DateFormat('MMMM d,EEEE').format(DateTime.fromMillisecondsSinceEpoch(weather.date*1000,isUtc: false))== DateFormat('MMMM d,EEEE').format(DateTime.now())
                                        ? 'Today'
                                        : DateFormat.EEEE().format(DateTime.fromMillisecondsSinceEpoch(weather.date*1000,isUtc: false)
                                    ),
                                    style: TextStyle(
                                      fontSize: context.height20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.droplet,
                                        color: Colors.white70,
                                        size: context.height10,
                                      ),
                                      Text(
                                        '${(weather.humidity).round()}%',
                                        style: TextStyle(
                                          fontSize: context.height15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      SizedBox(width: context.height30),
                                      Image.network(
                                        ApiConstance.weatherIcon(weather.icon),
                                        height: context.height20,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(child:
                                Row(
                                  children: [
                                    Text(
                                      '${weather.tempMax.round()}°',
                                      style: TextStyle(
                                        fontSize: context.height15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: context.width10,),
                                    Text(
                                      '${weather.tempMin.round()}°',
                                      style: TextStyle(
                                        fontSize: context.height15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                                )
                              ],
                            )
                          ],
                        ),
                      )
                  ],
                )
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
