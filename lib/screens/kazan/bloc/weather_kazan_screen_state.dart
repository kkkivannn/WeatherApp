import 'package:test_app/models/weather.dart';

abstract class WeatherKazanScreenState {}

class WeatherScreenEmptyState extends WeatherKazanScreenState {}

class WeatherScreenLodingState extends WeatherKazanScreenState {}

class WeatherScreenLoadedState extends WeatherKazanScreenState {
  final Weather loadedWeather;
  WeatherScreenLoadedState({required this.loadedWeather});
}

class WeatherScreenErrorState extends WeatherKazanScreenState {}
