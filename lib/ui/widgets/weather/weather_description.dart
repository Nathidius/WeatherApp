import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/resources/dimensions.dart';

import 'humidity_text.dart';
import 'pressure_text.dart';
import 'wind_speed_text.dart';

class WeatherDescription extends StatelessWidget {
  const WeatherDescription({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HumidityText(humidity: weather.humidity),
          PressureText(pressure: weather.airPressureMBars),
          WindSpeedText(windSpeedMPH: weather.windSpeedMPH),
        ],
      ),
    );
  }
}
