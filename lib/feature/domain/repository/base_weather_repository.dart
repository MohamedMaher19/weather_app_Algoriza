import 'package:dartz/dartz.dart';
import 'package:weather_app_algoriza/core/error/failure.dart';
import 'package:weather_app_algoriza/feature/domain/entity/current_weather_entity.dart';
import 'package:weather_app_algoriza/feature/domain/entity/daily_weather_entity.dart';
import 'package:weather_app_algoriza/feature/domain/entity/daily_with_cityName_entity.dart';
import 'package:weather_app_algoriza/feature/domain/entity/hourly_weather_chosed_city_entity.dart';
import 'package:weather_app_algoriza/feature/domain/entity/hourly_weather_entity.dart';
abstract class BaseWeatherRepository {

  // contract methods

  Future<Either<Failure, CurrentWeather>> getWeather();
  Future<Either<Failure, CurrentWeather>> getWeatherByCity(String cityName);
  Future<Either<Failure, List<HourlyWeather>>> getHourlyWeather();
  Future<Either<Failure, List<HourlyWeatherForChosedCity>>> getHourlyWeatherForChosedCity();
  Future<Either<Failure, List<DailyWeather>>> getDailyWeather();
  Future<Either<Failure, List<DailyWeatherWithCityName>>> getDailyWeatherWithCityName();
}