import 'package:flutter/material.dart';
import 'package:weather_app/resources/dimensions.dart';
import 'package:weather_app/resources/font_sizes.dart';

class WeatherStateText extends StatelessWidget {
  const WeatherStateText({
    Key? key,
    required this.weatherState,
  }) : super(key: key);

  final String weatherState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.medium),
      child: Text(
        weatherState,
        style: const TextStyle(
          fontSize: FontSizes.medium,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
