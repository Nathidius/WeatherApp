import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather/weather_bloc.dart';
import 'package:weather_app/blocs/weather/weather_event.dart';
import 'package:weather_app/resources/constants.dart';
import 'package:weather_app/resources/dimensions.dart';
import 'package:weather_app/resources/font_sizes.dart';
import 'package:weather_app/resources/strings.dart';
import 'package:weather_app/ui/widgets/common/refresh.dart';
import 'package:weather_app/ui/widgets/common/retry_button.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
    required this.refreshCompleter,
  }) : super(key: key);

  final Completer refreshCompleter;

  @override
  Widget build(BuildContext context) {
    return Refresh(
      onRefresh: () {
        context.read<WeatherBloc>().add(
            const WeatherEvent.weatherRefreshRequested(
                city: Constants.cityName));
        return refreshCompleter.future;
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              Strings.somethingWentWrong,
              style: TextStyle(fontSize: FontSizes.large),
            ),
            const SizedBox(height: Dimensions.large),
            RetryButton(onPressed: () {
              context.read<WeatherBloc>().add(
                  const WeatherEvent.weatherRequested(
                      city: Constants.cityName));
            }),
          ],
        ),
      ),
    );
  }
}
