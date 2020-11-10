import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/models/weather.dart';

part 'weather_state.freezed.dart';

@freezed
abstract class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;
  const factory WeatherState.loadInProgress() = _LoadInProgress;
  const factory WeatherState.loadSuccess(
      {@required List<Weather> weatherList}) = LoadSuccess;
  const factory WeatherState.loadFailure() = LoadFailure;
}
