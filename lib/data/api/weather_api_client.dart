import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/models/weather_data.dart';
import 'package:weather_app/resources/constants.dart';

@lazySingleton
class WeatherApiClient {
  WeatherApiClient(this._httpClient);

  final http.Client _httpClient;

  Future<int> getLocationId(String city) async {
    final locationUrl = Uri.parse(
        '${Constants.weatherApiBaseUrl}/api/location/search/?query=$city');
    final response = await _httpClient.get(locationUrl);

    if (response.isSuccessful) {
      final json = (jsonDecode(response.body) as List).first;
      return Location.fromJson(json).id;
    } else {
      throw Exception('error getting locationId for city');
    }
  }

  Future<WeatherData> fetchWeather(int locationId) async {
    final weatherUrl =
        Uri.parse('${Constants.weatherApiBaseUrl}/api/location/$locationId');
    final response = await _httpClient.get(weatherUrl);

    if (response.isSuccessful) {
      final json = jsonDecode(response.body);
      return WeatherData.fromJson(json);
    } else {
      throw Exception('error getting weather for location');
    }
  }
}

extension _ResponseExtensions on http.Response {
  bool get isSuccessful =>
      statusCode >= HttpStatus.ok && statusCode < HttpStatus.multipleChoices;
}
