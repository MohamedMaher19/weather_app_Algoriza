import 'package:flutter/material.dart';
import 'package:weather_app_algoriza/core/styles/dimensions.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/chosed_city/chosed_appbar.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/chosed_city_body/chosed_city_chart.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/chosed_city_body/chosed_city_status.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/chosed_city_body/chosed_city_suntime.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/chosed_city_body/chosed_city_time_table.dart';


class ChosedBuildBody extends StatelessWidget {
  const ChosedBuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const ChosedAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.height20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: context.height30),
              const ChosedCityChart(),
              SizedBox(height: context.height30),
              const ChosedCityTimeTable(),
              SizedBox(height: context.height30),
              const ChosedCitySunTime(),
              SizedBox(height: context.height30),
              const ChosedCityStatus(),
              SizedBox(height: context.height30),
            ]),
          ),
        )
      ],
    );
  }
}
