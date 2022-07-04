import 'package:test_app/models/weather.dart';

abstract class WeatherKaliningradScreenState {}

class WeatherScreenEmptyState extends WeatherKaliningradScreenState {}

class WeatherScreenLodingState extends WeatherKaliningradScreenState {}

class WeatherScreenLoadedState extends WeatherKaliningradScreenState {
  final Weather loadedWeather;
  WeatherScreenLoadedState({required this.loadedWeather});
}

class WeatherScreenErrorState extends WeatherKaliningradScreenState {}
