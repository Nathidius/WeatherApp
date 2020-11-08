import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/settings/settings_cubit.dart';
import 'package:weather_app/cubits/settings/settings_state.dart';
import 'package:weather_app/data/converters/temperature_unit_converter.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/resources/durations.dart';
import 'package:weather_app/resources/font_sizes.dart';
import 'package:weather_app/resources/units.dart';

class CurrentTemperatureText extends StatelessWidget {
  const CurrentTemperatureText({Key key, @required this.temperatureCelsius})
      : assert(temperatureCelsius != null),
        super(key: key);

  final double temperatureCelsius;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final temperature = state.isCelsius
            ? temperatureCelsius
            : TemperatureUnitConverter.toFahrenheit(
                celsius: temperatureCelsius);
        final unit = state.isCelsius
            ? Units.temperature.degreesCelsius
            : Units.temperature.degreesFahrenheit;
        final text = '${temperature.round()}$unit';
        return Center(
          child: AnimatedSwitcher(
            duration: Durations.medium,
            child: Text(
              text,
              key: Key(text),
              style: const TextStyle(fontSize: FontSizes.huge),
            ),
          ),
        );
      },
    );
  }
}

class MinMaxTemperatureText extends StatelessWidget {
  const MinMaxTemperatureText({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final minTemperature = state.isCelsius
            ? weather.minTempCelsius
            : TemperatureUnitConverter.toFahrenheit(
                celsius: weather.minTempCelsius);
        final maxTemperature = state.isCelsius
            ? weather.maxTempCelsius
            : TemperatureUnitConverter.toFahrenheit(
                celsius: weather.maxTempCelsius);
        final unit = state.isCelsius
            ? Units.temperature.degreesCelsius
            : Units.temperature.degreesFahrenheit;
        return Text(
            '${minTemperature.round()}$unit/${maxTemperature.round()}$unit');
      },
    );
  }
}
