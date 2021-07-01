import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/resources/constants.dart';

@lazySingleton
class SettingsRepository {
  SettingsRepository(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  Future<bool> setTemperatureUnit(bool isCelsius) {
    return _sharedPreferences.setBool(Constants.temperatureUnitKey, isCelsius);
  }

  bool getTemperatureUnit() {
    return _sharedPreferences.getBool(Constants.temperatureUnitKey) ?? true;
  }
}
