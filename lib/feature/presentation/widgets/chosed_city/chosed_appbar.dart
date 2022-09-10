import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_algoriza/core/styles/dimensions.dart';
import 'package:weather_app_algoriza/core/utils/enums.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_bloc.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_state.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/chosed_city/chosed_header.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/header.dart';


class ChosedAppBar extends StatelessWidget {
  const ChosedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      SliverAppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        elevation: 0,
        snap: true,
        pinned: true,
        floating: true,
        expandedHeight: context.height30*7,
        title: BlocBuilder<WeatherBloc,WeatherState>(
            buildWhen: (previous, current) => previous.currentRequestStateByCity != current.currentRequestStateByCity,
            builder: (context,state){
              switch (state.currentRequestStateByCity){
                case RequestState.loading:
                  return const Center();
                case RequestState.loaded:
                  return Row(
                    children: [
                      Text(state.currentWeatherByCity!.cityName,style: TextStyle(fontSize: context.height30,color: Colors.white, fontWeight: FontWeight.bold),),
                      SizedBox(width: context.width10),
                      Icon(Icons.location_on,color: Colors.white,size: context.height20,),
                    ],
                  );
                case RequestState.error:
                  return Center(
                    child: Text(state.currentMessage),
                  );
                default:
                  return const SizedBox();
              }
            }),
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
          color: Colors.white,
          iconSize: context.height30,
        ),
        flexibleSpace: const FlexibleSpaceBar(
          background: ChosedCityHeader(),
        ),

      );

  }
}
