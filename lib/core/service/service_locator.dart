import 'package:get_it/get_it.dart';
import 'package:weather_app_algoriza/Feature/data/repository/weather_repository.dart';
import 'package:weather_app_algoriza/feature/data/dataSource/base_weather_data_source.dart';
import 'package:weather_app_algoriza/feature/domain/repository/base_weather_repository.dart';
import 'package:weather_app_algoriza/feature/domain/usecases/get_current_weather_use_case.dart';
import 'package:weather_app_algoriza/feature/domain/usecases/get_daily_weather_use_case.dart';
import 'package:weather_app_algoriza/feature/domain/usecases/get_daily_weather_usecase_with_cityname.dart';
import 'package:weather_app_algoriza/feature/domain/usecases/get_hourly_weather_use_case.dart';
import 'package:weather_app_algoriza/feature/domain/usecases/get_hourly_weather_use_case_chosed_city.dart';
import 'package:weather_app_algoriza/feature/domain/usecases/get_weather_by_cityname_use_case.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init(){

    // register data sources
    sl.registerLazySingleton<BaseWeatherDataSource>(() => WeatherRemoteDataSource());

    // register repositories
    sl.registerLazySingleton<BaseWeatherRepository>(() => WeatherRepository(weatherDataSource: sl()));

    // register use cases
    sl.registerLazySingleton<GetCurrentWeatherUseCase>(() => GetCurrentWeatherUseCase(sl()));
    sl.registerLazySingleton<GetWeatherByCityUseCase>(() => GetWeatherByCityUseCase(sl()));
    sl.registerLazySingleton<GetDailyWeatherUseCase>(() => GetDailyWeatherUseCase(sl()));
    sl.registerLazySingleton<GetHourlyWeatherUseCase>(() => GetHourlyWeatherUseCase(sl()));
    sl.registerLazySingleton<GetDailyWeatherWithCityNameUseCase>(() => GetDailyWeatherWithCityNameUseCase(sl()));
    sl.registerLazySingleton<GetHourlyWeatherChosedCityUseCase>(() => GetHourlyWeatherChosedCityUseCase(sl()));


    // register blocs

    // using registerFactory as we need to make a new object of bloc to make refresh to data

    sl.registerFactory<WeatherBloc>(() => WeatherBloc(sl(), sl(), sl(), sl() , sl(), sl() ));
  }
}