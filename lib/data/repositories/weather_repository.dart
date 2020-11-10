import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:weather_app/data/api/weather_api_client.dart';
import 'package:weather_app/data/models/weather_data.dart';

@lazySingleton
class WeatherRepository {
  WeatherRepository(this._weatherApiClient) : assert(_weatherApiClient != null);

  final WeatherApiClient _weatherApiClient;

  Future<WeatherData> getWeatherData(String city) async {
    final int locationId = await _weatherApiClient.getLocationId(city);
    return _weatherApiClient.fetchWeather(locationId);
  }
}
