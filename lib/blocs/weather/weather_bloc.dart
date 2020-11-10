import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/models/weather_data.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';

import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(const WeatherState.initial());

  final WeatherRepository weatherRepository;

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    yield* event.map(
      weatherRequested: _mapWeatherRequestedEventToState,
      weatherRefreshRequested: _mapWeatherRefreshRequestedEventToState,
    );
  }

  Stream<WeatherState> _mapWeatherRequestedEventToState(
      WeatherEvent event) async* {
    yield const WeatherState.loadInProgress();
    try {
      final WeatherData weatherData =
          await weatherRepository.getWeatherData(event.city);
      yield WeatherState.loadSuccess(weatherList: weatherData.list);
    } catch (_) {
      yield const WeatherState.loadFailure();
    }
  }

  Stream<WeatherState> _mapWeatherRefreshRequestedEventToState(
      WeatherEvent event) async* {
    try {
      final WeatherData weatherData =
          await weatherRepository.getWeatherData(event.city);
      yield const WeatherState.loadInProgress();
      yield WeatherState.loadSuccess(weatherList: weatherData.list);
    } catch (_) {
      yield const WeatherState.loadFailure();
    }
  }
}
