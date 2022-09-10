import 'package:weather_app_algoriza/feature/domain/entity/daily_weather_entity.dart';
import 'package:weather_app_algoriza/feature/domain/entity/daily_with_cityName_entity.dart';

class DailyWeatherWithCityNameModel extends DailyWeatherWithCityName {
  DailyWeatherWithCityNameModel(
      {required super.tempMin,
        required super.tempMax,
        required super.humidity,
        required super.date,
        required super.icon ,
        // required super.lon,
        // required super.lat,
      });

  factory DailyWeatherWithCityNameModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherWithCityNameModel(
        tempMin: json['temp']['min'].toDouble(),
        tempMax: json['temp']['max'].toDouble(),
        humidity: json['humidity'],
        date: json['dt'],
        icon: json['weather'][0]['icon'],
        // lon: json['coord']['lon'],
        // lat: json['coord']['lat'],
    );
  }
}
