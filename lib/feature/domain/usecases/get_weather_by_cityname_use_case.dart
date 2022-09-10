import 'package:dartz/dartz.dart';
import 'package:weather_app_algoriza/core/error/failure.dart';
import 'package:weather_app_algoriza/feature/domain/entity/current_weather_entity.dart';
import 'package:weather_app_algoriza/feature/domain/repository/base_weather_repository.dart';


class GetWeatherByCityUseCase {
  final BaseWeatherRepository repository;

  GetWeatherByCityUseCase(this.repository);

  @override
  Future<Either<Failure, CurrentWeather>> getWeatherByCity(String cityName) async {
    return await repository.getWeatherByCity(cityName);
  }
}