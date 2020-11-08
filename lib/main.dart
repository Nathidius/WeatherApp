import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/cubits/settings/settings_cubit.dart';
import 'package:weather_app/data/repositories/settings_repository.dart';
import 'package:weather_app/resources/constants.dart';
import 'package:weather_app/resources/strings.dart';

import 'blocs/weather/weather_bloc.dart';
import 'blocs/weather/weather_event.dart';
import 'cubits/home/home_cubit.dart';
import 'data/api/weather_api_client.dart';
import 'data/repositories/weather_repository.dart';
import 'ui/screens/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );
  final SettingsRepository settingsRepository = SettingsRepository(
      sharedPreferences: await SharedPreferences.getInstance());
  runApp(WeatherApp(
    weatherRepository: weatherRepository,
    settingsRepository: settingsRepository,
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    Key key,
    @required this.weatherRepository,
    @required this.settingsRepository,
  })  : assert(weatherRepository != null),
        assert(settingsRepository != null),
        super(key: key);

  final WeatherRepository weatherRepository;
  final SettingsRepository settingsRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appTitle,
      theme: ThemeData(
        accentColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                WeatherBloc(weatherRepository: weatherRepository)
                  ..add(const WeatherRequested(city: Constants.cityName)),
          ),
          BlocProvider(
            create: (context) =>
                SettingsCubit(settingsRepository: settingsRepository),
          ),
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
