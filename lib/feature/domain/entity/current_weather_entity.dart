import 'package:equatable/equatable.dart';

class CurrentWeather extends Equatable {

  final String cityName;
  final String country;
  final double temperature;
  final String weatherDescription;
  final double feelsLikeTemperature;
  final double maxTemperature;
  final double minTemperature;
  final int humidity;
  final int pressure;
  final int sunrise;
  final int sunset;
  final double windspeed;
  final double longtitude;
  final double latitude;


  CurrentWeather({
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.weatherDescription,
    required this.feelsLikeTemperature,
    required this.maxTemperature,
    required this.minTemperature,
    required this.humidity,
    required this.pressure,
    required this.sunrise,
    required this.sunset,
    required this.windspeed,
    required this.longtitude,
    required this.latitude,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    cityName,
    country,
    temperature,
    weatherDescription,
    feelsLikeTemperature,
    humidity,
    pressure,
    sunrise,
    sunset,
    windspeed,
    maxTemperature,
    minTemperature,
    longtitude,
    latitude
  ];

}