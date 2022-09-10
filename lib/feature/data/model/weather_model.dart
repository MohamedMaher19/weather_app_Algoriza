

import 'package:weather_app_algoriza/feature/domain/entity/current_weather_entity.dart';

class WeatherModel extends CurrentWeather {
       WeatherModel
      ({required super.cityName,
        required super.country,
        required super.temperature,
        required super.weatherDescription,
        required super.feelsLikeTemperature,
        required super.humidity,
        required super.pressure,
        required super.sunrise,
        required super.sunset,
        required super.windspeed,
        required super.maxTemperature,
        required super.minTemperature,
         required super.latitude,
         required super.longtitude
      });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      country: json['sys']['country'],
      temperature: json['main']['temp'].toDouble(),
      weatherDescription: json['weather'][0]['description'],
      feelsLikeTemperature: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      windspeed: json['wind']['speed'].toDouble(),
      maxTemperature: json['main']['temp_max'].toDouble(),
      minTemperature: json['main']['temp_min'].toDouble(),
      latitude: json['coord']['lat'],
      longtitude: json['coord']['lon']
    );
  }
}
