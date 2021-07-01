import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather/weather_bloc.dart';
import 'package:weather_app/blocs/weather/weather_event.dart';
import 'package:weather_app/cubits/home/home_cubit.dart';
import 'package:weather_app/cubits/home/home_state.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/resources/constants.dart';
import 'package:weather_app/ui/widgets/common/refresh.dart';
import 'package:weather_app/ui/widgets/weather/weather_day_text.dart';
import 'package:weather_app/ui/widgets/weather/weather_description.dart';
import 'package:weather_app/ui/widgets/weather/weather_list_view.dart';
import 'package:weather_app/ui/widgets/weather/weather_main.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({
    Key? key,
    required this.weatherList,
    required this.refreshCompleter,
  }) : super(key: key);

  final List<Weather> weatherList;
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
      child: OrientationBuilder(builder: (context, orientation) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final selectedWeather = weatherList[state.selectedIndex];
            return orientation == Orientation.portrait
                ? _Portrait(
                    weatherList: weatherList,
                    selectedWeather: selectedWeather,
                  )
                : _Landscape(
                    weatherList: weatherList,
                    selectedWeather: selectedWeather,
                  );
          },
        );
      }),
    );
  }
}

class _Portrait extends StatelessWidget {
  const _Portrait({
    Key? key,
    required this.weatherList,
    required this.selectedWeather,
  }) : super(key: key);

  final List<Weather> weatherList;
  final Weather selectedWeather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherDayText(applicableDate: selectedWeather.applicableDate),
        WeatherMain(weather: selectedWeather),
        Expanded(child: WeatherDescription(weather: selectedWeather)),
        WeatherListView(
          weatherList: weatherList,
          scrollDirection: Axis.horizontal,
        ),
      ],
    );
  }
}

class _Landscape extends StatelessWidget {
  const _Landscape({
    Key? key,
    required this.weatherList,
    required this.selectedWeather,
  }) : super(key: key);

  final List<Weather> weatherList;
  final Weather selectedWeather;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              WeatherDayText(applicableDate: selectedWeather.applicableDate),
              Row(
                children: [
                  Expanded(child: WeatherMain(weather: selectedWeather)),
                  Expanded(child: WeatherDescription(weather: selectedWeather)),
                ],
              ),
            ],
          ),
        ),
        WeatherListView(
          weatherList: weatherList,
          scrollDirection: Axis.vertical,
        ),
      ],
    );
  }
}
