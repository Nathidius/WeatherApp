import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/blocs/weather_event.dart';
import 'package:weather_app/strings.dart';
import 'package:weather_app/ui/pages/home_page.dart';

import 'blocs/weather_bloc.dart';
import 'data/remote/weather_api_client.dart';
import 'data/repositories/weather_repository.dart';

void main() {
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(WeatherApp(
    weatherRepository: weatherRepository,
  ));
}

class WeatherApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  WeatherApp({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository: weatherRepository)
          ..add(WeatherRequested(city: 'London')),
        child: HomePage(),
      ),
    );
  }
}
