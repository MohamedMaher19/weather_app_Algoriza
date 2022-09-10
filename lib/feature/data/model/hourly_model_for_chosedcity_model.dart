
import 'package:weather_app_algoriza/feature/domain/entity/hourly_weather_chosed_city_entity.dart';

class HourlyWeatherForChosedCityModel extends HourlyWeatherForChosedCity {
  HourlyWeatherForChosedCityModel(
      {required super.icon,
        required super.time,
        required super.temperature,
        required super.humidity,
        // required super.long,
        // required super.lat,
      });

  factory HourlyWeatherForChosedCityModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherForChosedCityModel(
      icon: json['weather'][0]['icon'],
      time: json['dt'],
      temperature: json['temp'].toDouble(),
      humidity: json['humidity'].toDouble(),
      // lat: json['lat'],
      // long: json['lon']
    );
  }
}
