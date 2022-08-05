part of 'weather_moscow_cubit.dart';

abstract class WeatherMoscowState extends Equatable {
  const WeatherMoscowState();

  @override
  List<Object> get props => [];
}

class WeatherMoscowEmpty extends WeatherMoscowState {
  @override
  List<Object> get props => [];
}

class WeatherMoscowLoading extends WeatherMoscowState {
  final List<WeatherEntiti> oldWeather;
  final bool isFirstFetch;

  const WeatherMoscowLoading(this.oldWeather, {this.isFirstFetch = false});
  @override
  List<Object> get props => [oldWeather];
}

class WeatherMoscowLoaded extends WeatherMoscowState {
  final WeatherEntiti weather;

  const WeatherMoscowLoaded(this.weather);
  @override
  List<Object> get props => [weather];
}

class WeatherMoscowError extends WeatherMoscowState {
  final String message;

  const WeatherMoscowError({required this.message});

  @override
  List<Object> get props => [message];
}
