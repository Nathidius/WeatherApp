import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/resources/dimensions.dart';
import 'package:weather_app/resources/font_sizes.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key key,
    @required this.label,
    @required this.value,
    @required this.unit,
  })  : assert(label != null),
        assert(value != null),
        assert(unit != null),
        super(key: key);

  final String label;
  final Object value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.small,
      ),
      child: Text(
        '$label: $value $unit',
        style: const TextStyle(
          fontSize: FontSizes.medium,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
