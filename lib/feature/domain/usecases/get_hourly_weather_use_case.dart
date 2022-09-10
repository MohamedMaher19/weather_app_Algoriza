import 'package:dartz/dartz.dart';
import 'package:weather_app_algoriza/core/error/failure.dart';
import 'package:weather_app_algoriza/feature/domain/entity/hourly_weather_entity.dart';
import 'package:weather_app_algoriza/feature/domain/repository/base_weather_repository.dart';



class GetHourlyWeatherUseCase {
  final BaseWeatherRepository _repository;

  GetHourlyWeatherUseCase(this._repository);

  Future<Either<Failure, List<HourlyWeather>>> getHourlyWeather() async {
    return await _repository.getHourlyWeather();
  }
}