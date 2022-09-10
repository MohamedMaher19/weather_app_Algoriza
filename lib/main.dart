import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_algoriza/core/service/service_locator.dart';
import 'package:weather_app_algoriza/core/styles/themeChange/theme_bloc.dart';
import 'package:weather_app_algoriza/core/utils/preferences.dart';
import 'package:weather_app_algoriza/feature/presentation/pages/home_screen.dart';
import 'package:weather_app_algoriza/feature/presentation/pages/splash_screen.dart';
import 'Core/error/exceptions.dart';
import 'Core/utils/globals.dart';
import 'Core/utils/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  Preferences.init();
  LocationPermission permission;
  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location Not Available');
    }
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw LocationDisabledException();
    }
  }
  // bool serviceEnabled;
  // LocationPermission permission;
  //
  // // Test if location services are enabled.
  // serviceEnabled = await Geolocator.isLocationServiceEnabled();
  // if (!serviceEnabled) {
  //   // Location services are not enabled don't continue
  //   // accessing the position and request users of the
  //   // App to enable the location services.
  //   return Future.error('Location services are disabled.');
  // }
  //
  // permission = await Geolocator.checkPermission();
  // if (permission == LocationPermission.denied) {
  //   permission = await Geolocator.requestPermission();
  //   if (permission == LocationPermission.denied) {
  //     // Permissions are denied, next time you could try
  //     // requesting permissions again (this is also where
  //     // Android's shouldShowRequestPermissionRationale
  //     // returned true. According to Android guidelines
  //     // your App should show an explanatory UI now.
  //     return Future.error('Location permissions are denied');
  //   }
  // }
  //
  // if (permission == LocationPermission.deniedForever) {
  //   // Permissions are denied forever, handle appropriately.
  //   return Future.error(
  //       'Location permissions are permanently denied, we cannot request permissions.');
  // }
  //
  // // When we reach here, permissions are granted and we can
  // // continue accessing the position of the device.
  //  await Geolocator.getCurrentPosition();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc,ThemeState>(
          builder: (context,state){
            return MaterialApp(
                title: 'Weather App',
                theme: state.themeData,
                debugShowCheckedModeBanner: false,
                navigatorKey: Globals.instance.navigatorKey,
                onGenerateRoute: (settings) => AppRoute.onGenerateRoutes(settings),
                home: const SplashScreen()
            );
          }
      ),
    );
  }
}
