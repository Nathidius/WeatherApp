import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/resources/constants.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
abstract class Weather implements _$Weather {
  const factory Weather({
    @JsonKey(name: 'weather_state_name') String weatherStateName,
    @JsonKey(name: 'weather_state_abbr') String weatherStateAbbr,
    @JsonKey(name: 'applicable_date') DateTime applicableDate,
    @JsonKey(name: 'min_temp') double minTempCelsius,
    @JsonKey(name: 'max_temp') double maxTempCelsius,
    @JsonKey(name: 'the_temp') double theTempCelsius,
    @JsonKey(name: 'wind_speed') double windSpeedMPH,
    @JsonKey(name: 'air_pressure') double airPressureMBars,
    double humidity,
  }) = _Weather;

  const Weather._();

  factory Weather.fromJson(Map<String, dynamic> json) {
    return _$WeatherFromJson(json);
  }

  String get weatherStateImageUrl {
    return '${Constants.weatherApiBaseUrl}/static/img/weather/$weatherStateAbbr.svg';
  }
}
