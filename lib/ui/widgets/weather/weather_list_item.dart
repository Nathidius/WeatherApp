import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/resources/extensions.dart';
import 'package:weather_app/ui/widgets/common/rectangle.dart';
import 'package:weather_app/ui/widgets/weather/temperature_texts.dart';

class WeatherListItem extends StatelessWidget {
  const WeatherListItem({
    Key? key,
    required this.weather,
    required this.onPressed,
  }) : super(key: key);

  final Weather weather;
  final VoidCallback onPressed;

  static const double size = 150;
  static const double _imageSize = 50;

  @override
  Widget build(BuildContext context) {
    final day = weather.applicableDate.abbrThreeWeekDay;
    final imageUrl = weather.weatherStateImageUrl;
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Rectangle(
          size: size,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(day),
              SvgPicture.network(
                imageUrl,
                height: _imageSize,
              ),
              MinMaxTemperatureText(weather: weather),
            ],
          ),
        ),
      ),
    );
  }
}
