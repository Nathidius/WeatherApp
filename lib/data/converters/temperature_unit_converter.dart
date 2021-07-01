abstract class TemperatureUnitConverter {
  TemperatureUnitConverter._();

  static double toCelsius({required double fahrenheit}) =>
      (fahrenheit - 32) / 1.8;

  static double toFahrenheit({required double celsius}) => (celsius * 1.8) + 32;
}
