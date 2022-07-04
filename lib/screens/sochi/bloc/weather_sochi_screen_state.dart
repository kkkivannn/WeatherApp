import 'package:test_app/models/weather.dart';

abstract class WeatherSochiScreenState {}

class WeatherScreenEmptyState extends WeatherSochiScreenState {}

class WeatherScreenLodingState extends WeatherSochiScreenState {}

class WeatherScreenLoadedState extends WeatherSochiScreenState {
  final Weather loadedWeather;
  WeatherScreenLoadedState({required this.loadedWeather});
}

class WeatherScreenErrorState extends WeatherSochiScreenState {}
