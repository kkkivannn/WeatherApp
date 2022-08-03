part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherEmpty extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  final List<WeatherEntiti> oldWeather;
  final bool isFirstFetch;

  const WeatherLoading(this.oldWeather, {this.isFirstFetch = false});
  @override
  List<Object> get props => [oldWeather];
}

class WeatherLoaded extends WeatherState {
  final WeatherEntiti weather;

  const WeatherLoaded(this.weather);
  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {
  final String message;

  const WeatherError({required this.message});

  @override
  List<Object> get props => [message];
}
