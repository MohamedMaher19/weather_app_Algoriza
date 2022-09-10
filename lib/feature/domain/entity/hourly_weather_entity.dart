import 'package:equatable/equatable.dart';

class HourlyWeather extends Equatable {
  String icon;
  int time;
  double temperature;
  double humidity;
  // double lat;
  // double long;

  HourlyWeather({
    required this.icon,
    required this.time,
    required this.temperature,
    required this.humidity,
    // required this.lat,
    // required this.long,
  });

  @override
  List<Object> get props => [icon, time, temperature, humidity , ];
}
