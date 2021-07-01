import 'package:flutter/material.dart';
import 'package:weather_app/data/converters/speed_unit_converter.dart';
import 'package:weather_app/resources/strings.dart';
import 'package:weather_app/resources/units.dart';
import 'package:weather_app/ui/widgets/common/descripion_text.dart';

class WindSpeedText extends StatelessWidget {
  const WindSpeedText({
    Key? key,
    required this.windSpeedMPH,
  }) : super(key: key);

  final double windSpeedMPH;

  @override
  Widget build(BuildContext context) {
    final windSpeed = SpeedUnitConverter.toKilometersPerHour(mph: windSpeedMPH);
    return DescriptionText(
      label: Strings.wind,
      value: windSpeed.round(),
      unit: Units.speed.kilometersPerHour,
    );
  }
}
