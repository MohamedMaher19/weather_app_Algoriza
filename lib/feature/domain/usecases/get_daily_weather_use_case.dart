import 'package:dartz/dartz.dart';
import 'package:weather_app_algoriza/core/error/failure.dart';
import 'package:weather_app_algoriza/feature/domain/entity/daily_weather_entity.dart';
import 'package:weather_app_algoriza/feature/domain/repository/base_weather_repository.dart';



class GetDailyWeatherUseCase {
  final BaseWeatherRepository _repository;

  GetDailyWeatherUseCase(this._repository);

  Future<Either<Failure, List<DailyWeather>>> getWeather() async {
    return await _repository.getDailyWeather();
  }
}