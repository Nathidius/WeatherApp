import 'package:weather_app/resources/constants.dart';

class WeatherData {
  WeatherData({this.list});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
        list: List<Weather>.from(json['consolidated_weather'].map((cw) {
      return Weather.fromJson(cw);
    })));
  }

  List<Weather> list;
}

class Weather {
  Weather({
    this.weatherStateName,
    this.weatherStateAbbr,
    this.applicableDate,
    this.minTempCelsius,
    this.maxTempCelsius,
    this.theTempCelsius,
    this.windSpeedMPH,
    this.airPressureMBars,
    this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      weatherStateName: json['weather_state_name'],
      weatherStateAbbr: json['weather_state_abbr'],
      applicableDate: DateTime.parse(json['applicable_date']),
      minTempCelsius: json['min_temp'],
      maxTempCelsius: json['max_temp'],
      theTempCelsius: json['the_temp'],
      windSpeedMPH: json['wind_speed'],
      airPressureMBars: json['air_pressure'],
      humidity: json['humidity'],
    );
  }

  String weatherStateName;
  String weatherStateAbbr;
  DateTime applicableDate;
  double minTempCelsius;
  double maxTempCelsius;
  double theTempCelsius;
  double windSpeedMPH;
  double airPressureMBars;
  int humidity;

  String get weatherStateImageUrl {
    return '${Constants.weatherApiBaseUrl}/static/img/weather/$weatherStateAbbr.svg';
  }
}
