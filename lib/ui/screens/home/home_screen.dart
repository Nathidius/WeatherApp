import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather/weather_bloc.dart';
import 'package:weather_app/blocs/weather/weather_state.dart';
import 'package:weather_app/ui/pages/error_page.dart';
import 'package:weather_app/ui/pages/loading_page.dart';
import 'package:weather_app/ui/pages/weather_page.dart';
import 'package:weather_app/ui/widgets/common/top_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is LoadSuccess || state is LoadFailure) {
            _resetRefreshCompleter();
          }
        },
        builder: (context, state) {
          return state.map(
              initial: (_) => Container(),
              loadInProgress: (_) => const LoadingPage(),
              loadSuccess: (state) {
                return WeatherPage(
                  weatherList: state.weatherList,
                  refreshCompleter: _refreshCompleter,
                );
              },
              loadFailure: (_) =>
                  ErrorPage(refreshCompleter: _refreshCompleter));
        },
      ),
    );
  }

  void _resetRefreshCompleter() {
    _refreshCompleter?.complete();
    _refreshCompleter = Completer();
  }
}
