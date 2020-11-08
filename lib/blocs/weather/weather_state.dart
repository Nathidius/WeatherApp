import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/models/weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  const WeatherLoadSuccess({@required this.weatherList})
      : assert(weatherList != null);

  final List<Weather> weatherList;

  @override
  List<Object> get props => [weatherList];
}

class WeatherLoadFailure extends WeatherState {}
