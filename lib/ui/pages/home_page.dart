import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/blocs/weather_bloc.dart';
import 'package:weather_app/blocs/weather_state.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/ui/widgets/rectangle.dart';

import '../../strings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            Strings.appTitle,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Center(child: Text('Please Select a Location'));
            }
            if (state is WeatherLoadInProgress) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoadSuccess) {
              return WeatherWidget(weather: state.weather);
            }
            if (state is WeatherLoadFailure) {
              return Text('Something went wrong');
            }
            return Container();
          },
        ));
  }
}

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  WeatherWidget({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final consolidatedWeather = weather.consolidatedWeather.first;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WeatherStateText(
            weatherState: consolidatedWeather.weatherStateName,
          ),
          WeatherConditionImage(
            imageUrl: consolidatedWeather.weatherStateImageUrl,
          ),
          TemperatureText(
            temperature: consolidatedWeather.theTemp,
          ),
          HumidityText(
            humidity: consolidatedWeather.humidity,
          ),
          PressureText(
            pressure: consolidatedWeather.airPressure,
          ),
          WindSpeedText(
            windSpeed: consolidatedWeather.windSpeed,
          ),
          Spacer(),
          WeatherListView(
            consolidatedWeatherList: weather.consolidatedWeather,
          ),
        ],
      ),
    );
  }
}

class WeatherStateText extends StatelessWidget {
  final String weatherState;

  WeatherStateText({Key key, @required this.weatherState})
      : assert(weatherState != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        weatherState,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class WeatherConditionImage extends StatelessWidget {
  final String imageUrl;

  WeatherConditionImage({Key key, @required this.imageUrl})
      : assert(imageUrl != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      imageUrl,
      height: MediaQuery.of(context).size.height / 3,
    );
  }
}

class TemperatureText extends StatelessWidget {
  final double temperature;

  TemperatureText({Key key, @required this.temperature})
      : assert(temperature != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${temperature.round()}°',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}

class HumidityText extends StatelessWidget {
  final int humidity;

  HumidityText({Key key, @required this.humidity})
      : assert(humidity != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        '${Strings.humidity}: $humidity%',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class PressureText extends StatelessWidget {
  final double pressure;

  PressureText({Key key, @required this.pressure})
      : assert(pressure != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        '${Strings.pressure}: ${pressure.round()} hPa',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class WindSpeedText extends StatelessWidget {
  final double windSpeed;

  WindSpeedText({Key key, @required this.windSpeed})
      : assert(windSpeed != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        '${Strings.wind}: $windSpeed km/h',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class WeatherListView extends StatelessWidget {
  final List<ConsolidatedWeather> consolidatedWeatherList;

  WeatherListView({Key key, @required this.consolidatedWeatherList})
      : assert(consolidatedWeatherList != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemCount: consolidatedWeatherList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => WeatherListItem(
          consolidatedWeather: consolidatedWeatherList[index],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 8),
      ),
    );
  }
}

class WeatherListItem extends StatelessWidget {
  final ConsolidatedWeather consolidatedWeather;

  WeatherListItem({Key key, @required this.consolidatedWeather})
      : assert(consolidatedWeather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final minTemp = consolidatedWeather.minTemp;
    final maxTemp = consolidatedWeather.maxTemp;
    final day = consolidatedWeather.applicableDate;
    final imageUrl = consolidatedWeather.weatherStateImageUrl;
    return Card(
      child: InkWell(
        onTap: () {},
        child: Rectangle(
          size: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(day),
              SvgPicture.network(
                imageUrl,
                height: 50,
              ),
              Text('${minTemp.round()}°/${maxTemp.round()}°')
            ],
          ),
        ),
      ),
    );
  }
}
