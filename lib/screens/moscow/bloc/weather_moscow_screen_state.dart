import 'package:test_app/models/weather.dart';

abstract class WeatherMoscowScreenState {}

class WeatherScreenEmptyState extends WeatherMoscowScreenState {}

class WeatherScreenLodingState extends WeatherMoscowScreenState {}

class WeatherScreenLoadedState extends WeatherMoscowScreenState {
  final Weather loadedWeather;
  WeatherScreenLoadedState({required this.loadedWeather});
}

class WeatherScreenErrorState extends WeatherMoscowScreenState {}
