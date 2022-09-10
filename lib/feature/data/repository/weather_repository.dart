import 'package:dartz/dartz.dart';
import 'package:weather_app_algoriza/core/error/exceptions.dart';
import 'package:weather_app_algoriza/core/error/failure.dart';
import 'package:weather_app_algoriza/feature/data/dataSource/base_weather_data_source.dart';
import 'package:weather_app_algoriza/feature/domain/entity/current_weather_entity.dart';
import 'package:weather_app_algoriza/feature/domain/entity/daily_weather_entity.dart';
import 'package:weather_app_algoriza/feature/domain/entity/daily_with_cityName_entity.dart';
import 'package:weather_app_algoriza/feature/domain/entity/hourly_weather_chosed_city_entity.dart';
import 'package:weather_app_algoriza/feature/domain/entity/hourly_weather_entity.dart';
import 'package:weather_app_algoriza/feature/domain/repository/base_weather_repository.dart';

class WeatherRepository extends BaseWeatherRepository{
  final BaseWeatherDataSource weatherDataSource;

  WeatherRepository({required this.weatherDataSource});

  @override

  // هنا الفانكشن اخدت الموديل ال موجود في ال entity بعكس ال حصل في datasource
  Future<Either<Failure, CurrentWeather>> getWeather() async {
    final result = await weatherDataSource.getWeather();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.message));
    }
  }

  @override
  Future<Either<Failure, CurrentWeather>> getWeatherByCity(String city) async {
    final result = await weatherDataSource.getWeatherByCity(city);
    print(result);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.message));
    }
  }

  @override
  Future<Either<Failure, List<HourlyWeather>>> getHourlyWeather() async {
    final result = await weatherDataSource.getHourlyWeather();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.message));
    }
  }

  @override
  Future<Either<Failure, List<DailyWeather>>> getDailyWeather() async{
    final result = await weatherDataSource.getDailyWeather();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.message));
    }
  }

  @override
  Future<Either<Failure, List<DailyWeatherWithCityName>>> getDailyWeatherWithCityName()async {
    final result = await weatherDataSource.getDailyWeatherWithCityName();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.message));
    }
  }

  @override
  Future<Either<Failure, List<HourlyWeatherForChosedCity>>> getHourlyWeatherForChosedCity() async{
    final result = await weatherDataSource.getHourlyWeatherForChosedCity();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.message));
    }
  }

}