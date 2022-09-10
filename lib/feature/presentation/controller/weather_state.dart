import 'package:equatable/equatable.dart';
import 'package:weather_app_algoriza/core/utils/enums.dart';
import 'package:weather_app_algoriza/feature/domain/entity/current_weather_entity.dart';
import 'package:weather_app_algoriza/feature/domain/entity/daily_weather_entity.dart';
import 'package:weather_app_algoriza/feature/domain/entity/daily_with_cityName_entity.dart';
import 'package:weather_app_algoriza/feature/domain/entity/hourly_weather_chosed_city_entity.dart';
import 'package:weather_app_algoriza/feature/domain/entity/hourly_weather_entity.dart';


class WeatherState extends Equatable {
  final CurrentWeather? currentWeather;
  final CurrentWeather? currentWeatherByCity;
  final List<DailyWeather> dailyWeather;
  final List<DailyWeatherWithCityName> dailyWeatherWithCityName;
  final List<HourlyWeather> hourlyWeather;
  final List<HourlyWeatherForChosedCity> hourlyWeatherForChosedCity;

  final RequestState currentRequestState;
  final RequestState dailyRequestState;
  final RequestState dailyRequestStateWithCityName;
  final RequestState hourlyRequestState;
  final RequestState hourlyRequestForChosedCityState;
  final RequestState currentRequestStateByCity;

  final String currentMessage;
  final String dailyMessage;
  final String dailyWithCityNameMessage;
  final String hourlyMessage;
  final String hourlyForChosedCityMessage;
  final String currentMessageByCity;


  // this is initial states

  const WeatherState({
    this.currentWeather,
    this.currentWeatherByCity,
    this.dailyWeather = const [],
    this.dailyWeatherWithCityName = const [],
    this.hourlyWeather = const [],
    this.hourlyWeatherForChosedCity = const [],
    this.currentRequestState = RequestState.loading,
    this.dailyRequestState = RequestState.loading,
    this.dailyRequestStateWithCityName = RequestState.loading,
    this.hourlyRequestState = RequestState.loading,
    this.hourlyRequestForChosedCityState = RequestState.loading,
    this.currentRequestStateByCity = RequestState.loading,
    this.currentMessageByCity = '',
    this.currentMessage = '',
    this.dailyMessage = '',
    this.dailyWithCityNameMessage = '',
    this.hourlyMessage = '',
    this.hourlyForChosedCityMessage = '',
  });

  WeatherState copyWith
      ({
    CurrentWeather? currentWeather,
    CurrentWeather? currentWeatherByCity,
    List<DailyWeather>? dailyWeather,
    List<DailyWeatherWithCityName>? dailyWeatherWithCityName,
    List<HourlyWeather>? hourlyWeather,
    List<HourlyWeatherForChosedCity>? hourlyWeatherForChosedCity,
    RequestState? currentRequestState,
    RequestState? dailyRequestState,
    RequestState? hourlyRequestState,
    RequestState? hourlyRequestStateForChosedCityState,
    RequestState? dailyRequestStateWithCityName,
    RequestState? currentRequestStateByCity,
    String? currentMessage,
    String? dailyMessage,
    String? dailyWithCityNameMessage,
    String? hourlyMessage,
    String? hourlyMessageForChosedCity,
    String? currentMessageByCity,
  }) {

    // as if the data is empty ? you have to return the main data
    return WeatherState(
      currentWeather: currentWeather ?? this.currentWeather,
      currentWeatherByCity: currentWeatherByCity ?? this.currentWeatherByCity,
      dailyWeather: dailyWeather ?? this.dailyWeather,
      dailyWeatherWithCityName: dailyWeatherWithCityName ?? this.dailyWeatherWithCityName,
      hourlyWeather: hourlyWeather ?? this.hourlyWeather,
      hourlyWeatherForChosedCity: hourlyWeatherForChosedCity ?? this.hourlyWeatherForChosedCity,
      currentRequestState: currentRequestState ?? this.currentRequestState,
      dailyRequestState: dailyRequestState ?? this.dailyRequestState,
      dailyRequestStateWithCityName: dailyRequestStateWithCityName ?? this.dailyRequestStateWithCityName,
      hourlyRequestState: hourlyRequestState ?? this.hourlyRequestState,
      hourlyRequestForChosedCityState: hourlyRequestStateForChosedCityState ?? this.hourlyRequestForChosedCityState,
      currentRequestStateByCity: currentRequestStateByCity ?? this.currentRequestStateByCity,
      currentMessage: currentMessage ?? this.currentMessage,
      dailyWithCityNameMessage: dailyWithCityNameMessage ?? this.dailyWithCityNameMessage,
      dailyMessage: dailyMessage ?? this.dailyMessage,
      hourlyMessage: hourlyMessage ?? this.hourlyMessage,
      hourlyForChosedCityMessage: hourlyMessageForChosedCity ?? this.hourlyForChosedCityMessage,
      currentMessageByCity: currentMessageByCity ?? this.currentMessageByCity,
    );
  }

  @override
  List<Object?> get props =>
      [
        currentWeather,
        dailyWeather,
        dailyWeatherWithCityName,
        hourlyWeather,
        hourlyWeatherForChosedCity,
        currentWeatherByCity,
        currentRequestState,
        dailyRequestState,
        dailyRequestStateWithCityName,
        hourlyRequestState,
        hourlyRequestState,
        currentRequestStateByCity,
        currentMessage,
        dailyMessage,
        dailyWithCityNameMessage,
        hourlyMessage,
        hourlyForChosedCityMessage,
        currentMessageByCity,


      ];}

