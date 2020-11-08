import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  const WeatherRequested({@required this.city}) : assert(city != null);

  final String city;

  @override
  List<Object> get props => [city];
}

class WeatherRefreshRequested extends WeatherEvent {
  const WeatherRefreshRequested({@required this.city}) : assert(city != null);

  final String city;

  @override
  List<Object> get props => [city];
}
