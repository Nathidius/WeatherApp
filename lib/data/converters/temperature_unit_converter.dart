abstract class TemperatureUnitConverter {
  TemperatureUnitConverter._();

  static double toCelsius({double fahrenheit}) => (fahrenheit - 32) / 1.8;

  static double toFahrenheit({double celsius}) => (celsius * 1.8) + 32;
}
