import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_algoriza/core/error/exceptions.dart';
import 'package:weather_app_algoriza/core/network/api_constance.dart';
import 'package:weather_app_algoriza/core/network/error_message_model.dart';
import 'package:weather_app_algoriza/feature/data/model/daily_weather_model.dart';
import 'package:weather_app_algoriza/feature/data/model/daily_weather_with_cityname_model.dart';
import 'package:weather_app_algoriza/feature/data/model/hourly_model_for_chosedcity_model.dart';
import 'package:weather_app_algoriza/feature/data/model/hourly_weather_model.dart';
import 'package:weather_app_algoriza/feature/data/model/weather_model.dart';
import 'package:weather_app_algoriza/feature/domain/entity/hourly_weather_chosed_city_entity.dart';



abstract class BaseWeatherDataSource {
  Future<WeatherModel> getWeather();
  Future<WeatherModel> getWeatherByCity(String city);
  Future<List<HourlyWeatherModel>> getHourlyWeather();
  Future<List<DailyWeatherModel>> getDailyWeather();
  Future<List<DailyWeatherWithCityNameModel>> getDailyWeatherWithCityName();
  Future<List<HourlyWeatherForChosedCity>> getHourlyWeatherForChosedCity();

}

class WeatherRemoteDataSource extends BaseWeatherDataSource {

  double  ? lat ;
  double  ? lon ;

  @override

  // هنا بستعمل الموديل ال جواه fromJson وليس الموديل ال في entity
  // لاني خلاص هتعامل مع الداتا فعليا

  Future<WeatherModel> getWeather() async{
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double latitude = position.latitude;
    double longitude = position.longitude;
    final response = await Dio().get(ApiConstance.currentWeatherByCoordinates(latitude, longitude));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<WeatherModel> getWeatherByCity(String city) async{
    final response = await Dio().get(ApiConstance.currentWeather(city));

    print('-----------------------------------');
    print('-----${response.data['coord']['lat']}');
    print('-----${response.data['coord']['lon']}');
    lat = response.data['coord']['lat'];
    lon = response.data['coord']['lon'];
    print('-----------------------------------');

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<HourlyWeatherModel>> getHourlyWeather() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double latitude = position.latitude;
    double longitude = position.longitude;

    final response = await Dio().get(ApiConstance.hourlyWeather(latitude, longitude));
    if (response.statusCode == 200) {
      return List<HourlyWeatherModel>.from(response.data['hourly'].map((item) => HourlyWeatherModel.fromJson(item)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<DailyWeatherModel>> getDailyWeather() async{
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double latitude = position.latitude;
    double longitude = position.longitude;
    final response = await Dio().get(ApiConstance.dailyWeather(latitude, longitude));
    if (response.statusCode == 200) {
      return List<DailyWeatherModel>.from(response.data['daily'].map((item) => DailyWeatherModel.fromJson(item)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<DailyWeatherWithCityNameModel>> getDailyWeatherWithCityName()async {
    double? latitude = lat;
    double? longitude = lon;
    final response = await Dio().get(ApiConstance.dailyWeatherWithCityName(latitude, longitude));
    if (response.statusCode == 200) {
      return List<DailyWeatherWithCityNameModel>.from(response.data['daily'].map((item) => DailyWeatherWithCityNameModel.fromJson(item)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<HourlyWeatherForChosedCityModel>> getHourlyWeatherForChosedCity()async {

    double? latitude = lat;
    double? longitude = lon;

    final response = await Dio().get(ApiConstance.hourlyWeatherForChoosedCity(latitude, longitude));
    if (response.statusCode == 200) {
      return List<HourlyWeatherForChosedCityModel>.from(response.data['hourly'].map((item) => HourlyWeatherForChosedCityModel.fromJson(item)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }

  }



}