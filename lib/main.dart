import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/settings/settings_cubit.dart';
import 'package:weather_app/resources/constants.dart';
import 'package:weather_app/resources/strings.dart';

import 'blocs/weather/weather_bloc.dart';
import 'blocs/weather/weather_event.dart';
import 'cubits/home/home_cubit.dart';
import 'di/injection.dart';
import 'ui/screens/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
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
            create: (context) => getIt<WeatherBloc>()
              ..add(const WeatherEvent.weatherRequested(
                  city: Constants.cityName)),
          ),
          BlocProvider(
            create: (context) => getIt<SettingsCubit>(),
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
