import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/resources/durations.dart';

class WeatherConditionImage extends StatelessWidget {
  const WeatherConditionImage({Key key, @required this.imageUrl})
      : assert(imageUrl != null),
        super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedSwitcher(
      duration: Durations.medium,
      child: SvgPicture.network(
        imageUrl,
        key: Key(imageUrl),
        height: math.min(size.height, size.width) / 3,
      ),
    );
  }
}
