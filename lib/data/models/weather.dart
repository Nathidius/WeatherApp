import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/resources/constants.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    @JsonKey(name: 'weather_state_name') required String weatherStateName,
    @JsonKey(name: 'weather_state_abbr') required String weatherStateAbbr,
    @JsonKey(name: 'applicable_date') required DateTime applicableDate,
    @JsonKey(name: 'min_temp') required double minTempCelsius,
    @JsonKey(name: 'max_temp') required double maxTempCelsius,
    @JsonKey(name: 'the_temp') required double theTempCelsius,
    @JsonKey(name: 'wind_speed') required double windSpeedMPH,
    @JsonKey(name: 'air_pressure') required double airPressureMBars,
    required double humidity,
  }) = _Weather;

  const Weather._();

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  String get weatherStateImageUrl {
    return '${Constants.weatherApiBaseUrl}/static/img/weather/$weatherStateAbbr.svg';
  }
}
