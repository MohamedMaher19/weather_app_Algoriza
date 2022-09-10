import 'package:equatable/equatable.dart';

class DailyWeatherWithCityName extends Equatable {
  double tempMin;
  double tempMax;
  int humidity;
  int date;
  String icon;
  // double lat;
  // double lon;

  DailyWeatherWithCityName(
      {
        required this.tempMin,
        required this.tempMax,
        required this.humidity,
        required this.date,
        required this.icon,
        // required this.lat,
        // required this.lon
      });

  @override
  List<Object> get props => [tempMin, tempMax, humidity, date, icon ,];
}
