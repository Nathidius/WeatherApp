# WeatherApp
<img align="right" src="https://github.com/Nikoro/WeatherApp/blob/main/demo.gif" alt="A demo illustraating the UI of the app" width="288" height="624" style="display: inline; float: right"/>

WeatherApp is a Flutter weather application.<br>
It displays weather information for *San Francisco* for the next few days.<br>
It uses data from [MetaWeather](https://www.metaweather.com/api/) REST API .

It supports:
1. Both portrait and landscape mode
2. Changing temperature's unit (°C/°F)

## Getting Started

This project uses [code generation tools](https://pub.dev/packages/build_runner).<br>
**Before building the project:**<br>
Run the below command in the terminal to generate necessary files:
```shell script
flutter pub run build_runner build --delete-conflicting-outputs
```

### Libraries
* [Flutter BloC](https://bloclibrary.dev/#/)
* [Http](https://pub.dev/packages/http)
* [Flutter Svg](https://pub.dev/packages/flutter_svg)
* [Intl](https://pub.dev/packages/intl)
* [Lite Rolling Switch](https://pub.dev/packages/lite_rolling_switch)
* [Shared Preferences](https://pub.dev/packages/shared_preferences)
* [Freezed](https://pub.dev/packages/freezed)
* [Json Serializable](https://pub.dev/packages/json_serializable)
* [Injectable](https://pub.dev/packages/injectable)
* [Get It](https://pub.dev/packages/get_it)