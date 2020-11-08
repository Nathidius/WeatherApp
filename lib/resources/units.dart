abstract class Units {
  Units._();

  static _Speed speed = const _Speed();
  static _Temperature temperature = const _Temperature();
  static _Pressure pressure = const _Pressure();
  static _Humidity humidity = const _Humidity();
}

class _Speed {
  const _Speed();

  String get kilometersPerHour => 'km/h';

  String get milesPerHour => 'mph';
}

class _Temperature {
  const _Temperature();

  String get degreesCelsius => '°C';

  String get degreesFahrenheit => '°F';
}

class _Pressure {
  const _Pressure();

  String get hectopascals => 'hPa';

  String get milibars => 'mbar';
}

class _Humidity {
  const _Humidity();

  String get percentages => '%';
}
