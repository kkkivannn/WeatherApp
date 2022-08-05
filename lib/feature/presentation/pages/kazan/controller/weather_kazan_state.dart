part of 'weather_kazan_cubit.dart';

abstract class WeatherKazanState extends Equatable {
  const WeatherKazanState();

  @override
  List<Object> get props => [];
}

class WeatherKazanEmpty extends WeatherKazanState {
  @override
  List<Object> get props => [];
}

class WeatherKazanLoading extends WeatherKazanState {
  final List<WeatherEntiti> oldWeather;
  final bool isFirstFetch;

  const WeatherKazanLoading(this.oldWeather, {this.isFirstFetch = false});
  @override
  List<Object> get props => [oldWeather];
}

class WeatherKazanLoaded extends WeatherKazanState {
  final WeatherEntiti weather;

  const WeatherKazanLoaded(this.weather);
  @override
  List<Object> get props => [weather];
}

class WeatherKazanError extends WeatherKazanState {
  final String message;

  const WeatherKazanError({required this.message});

  @override
  List<Object> get props => [message];
}
