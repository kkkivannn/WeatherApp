part of 'weather_sochi_cubit.dart';

abstract class WeatherSochiState extends Equatable {
  const WeatherSochiState();

  @override
  List<Object> get props => [];
}

class WeatherSochiEmpty extends WeatherSochiState {
  @override
  List<Object> get props => [];
}

class WeatherSochiLoading extends WeatherSochiState {
  final List<WeatherEntiti> oldWeather;
  final bool isFirstFetch;

  const WeatherSochiLoading(this.oldWeather, {this.isFirstFetch = false});
  @override
  List<Object> get props => [oldWeather];
}

class WeatherSochiLoaded extends WeatherSochiState {
  final WeatherEntiti weather;

  const WeatherSochiLoaded(this.weather);
  @override
  List<Object> get props => [weather];
}

class WeatherSochiError extends WeatherSochiState {
  final String message;

  const WeatherSochiError({required this.message});

  @override
  List<Object> get props => [message];
}
