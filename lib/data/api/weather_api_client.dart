import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/resources/constants.dart';

class WeatherApiClient {
  WeatherApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  final http.Client httpClient;

  Future<int> getLocationId(String city) async {
    final locationUrl =
        '${Constants.weatherApiBaseUrl}/api/location/search/?query=$city';
    final response = await httpClient.get(locationUrl);
    if (response.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final locationJson = jsonDecode(response.body) as List;
    return (locationJson.first)['woeid'];
  }

  Future<WeatherData> fetchWeather(int locationId) async {
    final weatherUrl =
        '${Constants.weatherApiBaseUrl}/api/location/$locationId';
    final response = await httpClient.get(weatherUrl);

    if (response.statusCode != 200) {
      throw Exception('error getting weather for location');
    }

    final json = jsonDecode(response.body);
    return WeatherData.fromJson(json);
  }
}
