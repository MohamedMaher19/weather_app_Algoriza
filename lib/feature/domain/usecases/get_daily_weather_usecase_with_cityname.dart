import 'package:dartz/dartz.dart';
import 'package:weather_app_algoriza/core/error/failure.dart';
import 'package:weather_app_algoriza/feature/domain/entity/daily_with_cityName_entity.dart';
import 'package:weather_app_algoriza/feature/domain/repository/base_weather_repository.dart';

class GetDailyWeatherWithCityNameUseCase {
  final BaseWeatherRepository repository;

  GetDailyWeatherWithCityNameUseCase(this.repository);

  Future<Either<Failure, List<DailyWeatherWithCityName>>> getDailyWeatherWithCityName() async {
    return await repository.getDailyWeatherWithCityName();
  }
}