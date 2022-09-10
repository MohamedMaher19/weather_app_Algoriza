import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_algoriza/core/styles/dimensions.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/chart.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/custom_app_bar.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/status.dart';
import 'package:weather_app_algoriza/feature/presentation/widgets/sun_time.dart';
import 'table.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.height20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: context.height30),
              const Chart(),
              SizedBox(height: context.height30),
              const TimeTable(),
              SizedBox(height: context.height30),
              const SunTime(),
              SizedBox(height: context.height30),
              const Status(),
              SizedBox(height: context.height30),
            ]),
          ),
        )
      ],
    );
  }
}
