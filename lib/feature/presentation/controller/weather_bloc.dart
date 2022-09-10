
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_algoriza/core/utils/enums.dart';
import 'package:weather_app_algoriza/feature/domain/usecases/get_current_weather_use_case.dart';
import 'package:weather_app_algoriza/feature/domain/usecases/get_daily_weather_use_case.dart';
import 'package:weather_app_algoriza/feature/domain/usecases/get_daily_weather_usecase_with_cityname.dart';
import 'package:weather_app_algoriza/feature/domain/usecases/get_hourly_weather_use_case.dart';
import 'package:weather_app_algoriza/feature/domain/usecases/get_hourly_weather_use_case_chosed_city.dart';
import 'package:weather_app_algoriza/feature/domain/usecases/get_weather_by_cityname_use_case.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_event.dart';
import 'package:weather_app_algoriza/feature/presentation/controller/weather_state.dart';



class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  final GetDailyWeatherUseCase getDailyWeatherUseCase;
  final GetHourlyWeatherUseCase getHourlyWeatherUseCase;
  final GetWeatherByCityUseCase getWeatherByCityUserCase;
  final GetDailyWeatherWithCityNameUseCase getDailyWeatherWithCityNameUseCase ;
  final GetHourlyWeatherChosedCityUseCase getHourlyWeatherChosedCityUseCase ;




  WeatherBloc(
      this.getCurrentWeatherUseCase,
      this.getDailyWeatherUseCase,
      this.getHourlyWeatherUseCase,
      this.getWeatherByCityUserCase,
      this.getDailyWeatherWithCityNameUseCase,
      this.getHourlyWeatherChosedCityUseCase
      )

  // at super we pass thr initial state for it
  // then we use ( on ) with its event to run the specific method
  // every event fire a method

      : super(const WeatherState()){
    on<GetCurrentWeatherEvent>(_getCurrentWeather);
    on<GetDailyWeatherEvent>(_getDailyWeather);
    on<GetHourlyWeatherEvent>(_getHourlyWeather);
    on<GetCurrentWeatherByCityEvent>(_getWeatherByCity);
    on<GetDailyWeatherWithCityNameEvent>(_getDailyWeatherWithCityName);
    on<GetHourlyWeatherForChosedCityEvent>(_getHourlyWeatherForChosedCity);
  }

  Future <void> _getCurrentWeather(GetCurrentWeatherEvent event ,emit) async {
    final result = await getCurrentWeatherUseCase.getWeather();
    print('--------- result---------$result');

    // every method i used Either in .. then i can use fold on that method to extract data
    // left for error and right for data

    result.fold(

      // using copy with to compare with the last state and make update

            (l) => emit(state.copyWith(currentRequestState: RequestState.error, currentMessage: l.message)),
            (r) => emit(state.copyWith(currentWeather: r, currentRequestState: RequestState.loaded))
    );
  }

  Future <void> _getDailyWeather(GetDailyWeatherEvent event ,emit) async {
    final result = await getDailyWeatherUseCase.getWeather();
    result.fold(
            (l) => emit(state.copyWith(dailyRequestState: RequestState.error, dailyMessage: l.message)),
            (r) => emit(state.copyWith(dailyWeather: r, dailyRequestState: RequestState.loaded))
    );
  }

  Future <void> _getHourlyWeather(GetHourlyWeatherEvent event ,emit) async {
    final result = await getHourlyWeatherUseCase.getHourlyWeather();
    result.fold(
            (l) => emit(state.copyWith(hourlyRequestState: RequestState.error, hourlyMessage: l.message)),
            (r) => emit(state.copyWith(hourlyWeather: r, hourlyRequestState: RequestState.loaded))
    );
  }
  Future <void> _getHourlyWeatherForChosedCity(GetHourlyWeatherForChosedCityEvent event ,emit) async {
    final result = await getHourlyWeatherChosedCityUseCase.getHourlyWeatherForChosedCity();
    result.fold(
            (l) => emit(state.copyWith(hourlyRequestStateForChosedCityState: RequestState.error, hourlyMessageForChosedCity: l.message)),
            (r) => emit(state.copyWith(hourlyWeatherForChosedCity: r, hourlyRequestStateForChosedCityState: RequestState.loaded))
    );
  }

  Future <void> _getWeatherByCity(GetCurrentWeatherByCityEvent event ,emit) async {
    final result = await getWeatherByCityUserCase.getWeatherByCity(event.cityName);
    print('---------this is result---------$result');
    result.fold(
            (l) => emit(state.copyWith  (currentRequestStateByCity: RequestState.error, currentMessageByCity: l.message)),
            (r) => emit(state.copyWith(currentWeatherByCity: r, currentRequestStateByCity: RequestState.loaded))
    );
  }
  Future <void> _getDailyWeatherWithCityName(GetDailyWeatherWithCityNameEvent event ,emit) async {
    final result = await getDailyWeatherWithCityNameUseCase.getDailyWeatherWithCityName();
    print('---------other result---------$result');
    result.fold(
            (l) => emit(state.copyWith  (dailyRequestStateWithCityName: RequestState.error, dailyWithCityNameMessage: l.message)),
            (r) => emit(state.copyWith(dailyWeatherWithCityName: r, dailyRequestStateWithCityName: RequestState.loaded))
    );
  }

}
