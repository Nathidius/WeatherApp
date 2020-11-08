import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';

import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial());

  final WeatherRepository weatherRepository;

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield* _mapWeatherRequestedToState(event);
    } else if (event is WeatherRefreshRequested) {
      yield* _mapWeatherRefreshRequestedToState(event);
    }
  }

  Stream<WeatherState> _mapWeatherRequestedToState(
      WeatherRequested event) async* {
    yield WeatherLoadInProgress();
    try {
      final WeatherData weatherData =
          await weatherRepository.getWeatherData(event.city);
      yield WeatherLoadSuccess(weatherList: weatherData.list);
    } catch (_) {
      yield WeatherLoadFailure();
    }
  }

  Stream<WeatherState> _mapWeatherRefreshRequestedToState(
      WeatherRefreshRequested event) async* {
    try {
      final WeatherData weatherData =
          await weatherRepository.getWeatherData(event.city);
      yield WeatherLoadSuccess(weatherList: weatherData.list);
    } catch (_) {
      yield WeatherLoadFailure();
    }
  }
}
