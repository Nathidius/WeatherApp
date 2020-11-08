import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  const SettingsState(this.isCelsius);

  final bool isCelsius;

  @override
  List<Object> get props => [isCelsius];
}
