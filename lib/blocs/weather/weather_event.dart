import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_event.freezed.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.weatherRequested({required String city}) =
      _WeatherRequested;

  const factory WeatherEvent.weatherRefreshRequested({required String city}) =
      _WeatherRefreshRequested;
}
