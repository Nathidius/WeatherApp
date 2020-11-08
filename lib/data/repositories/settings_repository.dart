import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/resources/constants.dart';

class SettingsRepository {
  SettingsRepository({@required this.sharedPreferences})
      : assert(sharedPreferences != null);

  final SharedPreferences sharedPreferences;

  Future<bool> setTemperatureUnit(bool isCelsius) {
    return sharedPreferences.setBool(Constants.temperatureUnitKey, isCelsius);
  }

  bool getTemperatureUnit() {
    return sharedPreferences.getBool(Constants.temperatureUnitKey) ?? true;
  }
}
