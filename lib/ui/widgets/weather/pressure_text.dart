import 'package:flutter/material.dart';
import 'package:weather_app/resources/strings.dart';
import 'package:weather_app/resources/units.dart';
import 'package:weather_app/ui/widgets/common/descripion_text.dart';

class PressureText extends StatelessWidget {
  const PressureText({
    Key? key,
    required this.pressure,
  }) : super(key: key);

  final double pressure;

  @override
  Widget build(BuildContext context) {
    return DescriptionText(
      label: Strings.pressure,
      value: pressure.round(),
      unit: Units.pressure.hectopascals,
    );
  }
}
