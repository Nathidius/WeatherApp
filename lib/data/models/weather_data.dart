import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/data/models/weather.dart';

part 'weather_data.freezed.dart';
part 'weather_data.g.dart';

@freezed
class WeatherData with _$WeatherData {
  const factory WeatherData({
    @JsonKey(name: 'consolidated_weather') required List<Weather> list,
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}
