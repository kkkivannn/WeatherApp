import 'coordinates.dart';

class WeatherEntiti {
  final dynamic temperature;
  final dynamic feelsLike;
  final dynamic speedWind;
  final String description;
  final CoordinatesEntiti coordinates;

  WeatherEntiti({
    required this.temperature,
    required this.feelsLike,
    required this.speedWind,
    required this.description,
    required this.coordinates,
  });
}
