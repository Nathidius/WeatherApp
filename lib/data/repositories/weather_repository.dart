import 'dart:async';

import 'package:meta/meta.dart';
import 'package:weather_app/data/api/weather_api_client.dart';
import 'package:weather_app/data/models/weather.dart';

class WeatherRepository {
  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  final WeatherApiClient weatherApiClient;

  Future<WeatherData> getWeatherData(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}
