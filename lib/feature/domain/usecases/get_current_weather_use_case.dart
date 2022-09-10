

import 'package:dartz/dartz.dart';
import 'package:weather_app_algoriza/core/error/failure.dart';
import 'package:weather_app_algoriza/feature/domain/entity/current_weather_entity.dart';
import 'package:weather_app_algoriza/feature/domain/repository/base_weather_repository.dart';

class GetCurrentWeatherUseCase {
  final BaseWeatherRepository _repository;

  GetCurrentWeatherUseCase(this._repository);

  Future<Either<Failure, CurrentWeather>> getWeather() async {
    return await _repository.getWeather();
  }
}