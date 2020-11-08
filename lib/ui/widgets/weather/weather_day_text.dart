import 'package:flutter/material.dart';
import 'package:weather_app/resources/dimensions.dart';
import 'package:weather_app/resources/durations.dart';
import 'package:weather_app/resources/extensions.dart';
import 'package:weather_app/resources/font_sizes.dart';

class WeatherDayText extends StatelessWidget {
  const WeatherDayText({Key key, @required this.applicableDate})
      : assert(applicableDate != null),
        super(key: key);

  final DateTime applicableDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.medium),
      child: AnimatedSwitcher(
        duration: Durations.medium,
        child: Text(
          applicableDate.weekDay,
          key: Key(applicableDate.weekDay),
          style: const TextStyle(fontSize: FontSizes.extraLarge),
        ),
      ),
    );
  }
}
