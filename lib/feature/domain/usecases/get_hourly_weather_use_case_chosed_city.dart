import 'package:dartz/dartz.dart';
import 'package:weather_app_algoriza/core/error/failure.dart';
import 'package:weather_app_algoriza/feature/domain/entity/hourly_weather_chosed_city_entity.dart';
import 'package:weather_app_algoriza/feature/domain/repository/base_weather_repository.dart';



class GetHourlyWeatherChosedCityUseCase {
  final BaseWeatherRepository _repository;

  GetHourlyWeatherChosedCityUseCase(this._repository);

  Future<Either<Failure, List<HourlyWeatherForChosedCity>>> getHourlyWeatherForChosedCity() async {
    return await _repository.getHourlyWeatherForChosedCity();
  }
}