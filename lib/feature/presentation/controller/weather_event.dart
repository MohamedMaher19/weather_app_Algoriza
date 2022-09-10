
import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}
// according to the number of use cases at my app

class GetCurrentWeatherEvent extends WeatherEvent {}

class GetDailyWeatherEvent extends WeatherEvent {}

class GetHourlyWeatherEvent extends WeatherEvent {}

class GetHourlyWeatherForChosedCityEvent extends WeatherEvent {}

class GetCurrentWeatherByCityEvent extends WeatherEvent {
  final String cityName;
  const GetCurrentWeatherByCityEvent(this.cityName);


  @override
  List<Object> get props => [cityName];
}

class GetDailyWeatherWithCityNameEvent extends WeatherEvent {
  final String cityName;
  const GetDailyWeatherWithCityNameEvent(this.cityName);


  @override
  List<Object> get props => [cityName];
}

