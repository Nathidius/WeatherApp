import 'package:flutter/material.dart';
import 'package:weather_app/resources/strings.dart';
import 'package:weather_app/resources/units.dart';
import 'package:weather_app/ui/widgets/common/descripion_text.dart';

class HumidityText extends StatelessWidget {
  const HumidityText({
    Key? key,
    required this.humidity,
  }) : super(key: key);

  final double humidity;

  @override
  Widget build(BuildContext context) {
    return DescriptionText(
      label: Strings.humidity,
      value: humidity,
      unit: Units.humidity.percentages,
    );
  }
}
