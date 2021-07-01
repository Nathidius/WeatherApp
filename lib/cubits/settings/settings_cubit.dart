import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/data/repositories/settings_repository.dart';

import 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._settingsRepository)
      : super(SettingsState(_settingsRepository.getTemperatureUnit()));

  final SettingsRepository _settingsRepository;

  Future<void> onTemperatureUnitChanged(bool isCelsius) async {
    await _settingsRepository.setTemperatureUnit(isCelsius);
    emit(SettingsState(isCelsius));
  }
}
