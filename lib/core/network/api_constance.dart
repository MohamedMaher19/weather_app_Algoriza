class ApiConstance{

  static const String baseUrl = "https://api.openweathermap.org/data/2.5" ;
  static const String appId = "appid=d0d253c5dca7fb4ab6caf8ec961238f2";
  static const String units = "units=metric";
  static String hourlyWeather(var latitude, var longitude) => "$baseUrl/onecall?lat=$latitude&lon=$longitude&exclude=daily,minutely,current,alerts&$units&$appId";
  static String currentWeather(String city) => "$baseUrl/weather?q=$city&$appId&$units";
  static String currentWeatherByCoordinates(var latitude, var longitude) => "$baseUrl/weather?lat=$latitude&lon=$longitude&$appId&$units";
  static String dailyWeather(var latitude, var longitude) => "$baseUrl/onecall?lat=$latitude&lon=$longitude&$appId&$units&cnt=7";
  static String weatherIcon(String icon) => "https://merakiapp.be/wp-content/uploads/2022/04/$icon.png";
  static String dailyWeatherWithCityName(var latitude, var longitude) => "$baseUrl/onecall?lat=$latitude&lon=$longitude&$appId&$units&cnt=7";
  static String hourlyWeatherForChoosedCity(var latitude, var longitude) => "$baseUrl/onecall?lat=$latitude&lon=$longitude&exclude=daily,minutely,current,alerts&$units&$appId";






}