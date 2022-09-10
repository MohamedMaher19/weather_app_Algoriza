import 'package:weather_app_algoriza/feature/domain/entity/daily_weather_entity.dart';

class DailyWeatherModel extends DailyWeather {
  DailyWeatherModel(
      {required super.tempMin,
      required super.tempMax,
      required super.humidity,
      required super.date,
      required super.icon});

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
        tempMin: json['temp']['min'].toDouble(),
        tempMax: json['temp']['max'].toDouble(),
        humidity: json['humidity'],
        date: json['dt'],
        icon: json['weather'][0]['icon']);
  }
}
