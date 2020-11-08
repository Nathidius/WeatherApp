import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:weather_app/cubits/settings/settings_cubit.dart';
import 'package:weather_app/cubits/settings/settings_state.dart';
import 'package:weather_app/resources/dimensions.dart';
import 'package:weather_app/resources/font_sizes.dart';
import 'package:weather_app/resources/units.dart';

class TemperatureUnitSwitch extends StatelessWidget {
  const TemperatureUnitSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.small),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return LiteRollingSwitch(
            value: state.isCelsius,
            textOn: Units.temperature.degreesCelsius,
            textOff: Units.temperature.degreesFahrenheit,
            iconOn: Icons.done,
            iconOff: Icons.done,
            colorOn: Colors.black,
            colorOff: Colors.black,
            textSize: FontSizes.large,
            onChanged: (value) {
              return context
                  .read<SettingsCubit>()
                  .onTemperatureUnitChanged(value);
            },
          );
        },
      ),
    );
  }
}
