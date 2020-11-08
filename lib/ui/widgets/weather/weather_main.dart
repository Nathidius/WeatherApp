import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather.dart';

import 'temperature_texts.dart';
import 'weather_condition_image.dart';
import 'weather_state_text.dart';

class WeatherMain extends StatelessWidget {
  const WeatherMain({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: WeatherStateText(weatherState: weather.weatherStateName)),
        WeatherConditionImage(imageUrl: weather.weatherStateImageUrl),
        CurrentTemperatureText(temperatureCelsius: weather.theTempCelsius),
      ],
    );
  }
}
