import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/home/home_cubit.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/resources/dimensions.dart';

import 'weather_list_item.dart';

class WeatherListView extends StatelessWidget {
  const WeatherListView(
      {Key key, @required this.weatherList, @required this.scrollDirection})
      : assert(weatherList != null),
        assert(scrollDirection != null),
        super(key: key);

  final List<Weather> weatherList;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: scrollDirection == Axis.horizontal ? WeatherListItem.size : null,
      width: scrollDirection == Axis.vertical ? WeatherListItem.size : null,
      margin: EdgeInsets.symmetric(
        vertical: scrollDirection == Axis.horizontal ? Dimensions.medium : 0,
        horizontal: scrollDirection == Axis.vertical ? Dimensions.medium : 0,
      ),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal:
              scrollDirection == Axis.horizontal ? Dimensions.medium : 0,
          vertical: scrollDirection == Axis.vertical ? Dimensions.medium : 0,
        ),
        itemCount: weatherList.length,
        scrollDirection: scrollDirection,
        itemBuilder: (context, index) => WeatherListItem(
          weather: weatherList[index],
          onPressed: () => context.read<HomeCubit>().onWeatherSelected(index),
        ),
        separatorBuilder: (context, index) => SizedBox(
            height: scrollDirection == Axis.vertical ? Dimensions.small : null,
            width:
                scrollDirection == Axis.horizontal ? Dimensions.small : null),
      ),
    );
  }
}
