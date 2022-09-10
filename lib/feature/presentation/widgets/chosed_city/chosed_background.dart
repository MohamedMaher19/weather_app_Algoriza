import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_algoriza/core/styles/colors.dart';
import 'package:weather_app_algoriza/core/styles/dimensions.dart';
import 'package:weather_app_algoriza/core/styles/images.dart';
import 'package:weather_app_algoriza/core/styles/themeChange/theme_bloc.dart';


class ChosedBackground extends StatelessWidget {
  const ChosedBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc,ThemeState>(
        builder: (context,state){
          return LottieBuilder.asset(
            state.themeData.primaryColor==secondaryLightColor?lightBackground:darkBackground,
            fit: BoxFit.cover,
            height: context.screenHeight,
            width: context.screenWidth,
          );
        }
    );
  }
}
