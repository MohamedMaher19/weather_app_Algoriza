import 'package:equatable/equatable.dart';

class DailyWeather extends Equatable {
  double tempMin;
  double tempMax;
  int humidity;
  int date;
  String icon;

  DailyWeather(
      {
        required this.tempMin,
        required this.tempMax,
        required this.humidity,
        required this.date,
        required this.icon
      });

  @override
  List<Object> get props => [tempMin, tempMax, humidity, date, icon];
}
