import 'package:test_app/models/weather.dart';

abstract class WeatherSaintPeterburgScreenState {}

class WeatherScreenEmptyState extends WeatherSaintPeterburgScreenState {}

class WeatherScreenLodingState extends WeatherSaintPeterburgScreenState {}

class WeatherScreenLoadedState extends WeatherSaintPeterburgScreenState {
  final Weather loadedWeather;
  WeatherScreenLoadedState({required this.loadedWeather});
}

class WeatherScreenErrorState extends WeatherSaintPeterburgScreenState {}
