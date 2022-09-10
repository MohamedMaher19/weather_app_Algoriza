
import 'package:weather_app_algoriza/feature/domain/entity/hourly_weather_entity.dart';

class HourlyWeatherModel extends HourlyWeather {
  HourlyWeatherModel(
      {required super.icon,
        required super.time,
        required super.temperature,
        required super.humidity,
        // required super.long,
        // required super.lat,
      });

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherModel(
      icon: json['weather'][0]['icon'],
      time: json['dt'],
      temperature: json['temp'].toDouble(),
      humidity: json['humidity'].toDouble(),
      // lat: json['lat'],
      // long: json['lon']
    );
  }
}
