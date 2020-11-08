import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repositories/settings_repository.dart';

import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({@required this.settingsRepository})
      : assert(settingsRepository != null),
        super(SettingsState(settingsRepository.getTemperatureUnit()));

  final SettingsRepository settingsRepository;

  Future<void> onTemperatureUnitChanged(bool isCelsius) async {
    await settingsRepository.setTemperatureUnit(isCelsius);
    emit(SettingsState(isCelsius));
  }
}
