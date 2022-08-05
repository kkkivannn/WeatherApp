part of 'weather_kaliningrad_cubit.dart';

abstract class WeatherKaliningradState extends Equatable {
  const WeatherKaliningradState();

  @override
  List<Object> get props => [];
}

class WeatherKaliningradEmpty extends WeatherKaliningradState {
  @override
  List<Object> get props => [];
}

class WeatherKaliningradLoading extends WeatherKaliningradState {
  final List<WeatherEntiti> oldWeather;
  final bool isFirstFetch;

  const WeatherKaliningradLoading(this.oldWeather, {this.isFirstFetch = false});
  @override
  List<Object> get props => [oldWeather];
}

class WeatherKaliningradLoaded extends WeatherKaliningradState {
  final WeatherEntiti weather;

  const WeatherKaliningradLoaded(this.weather);
  @override
  List<Object> get props => [weather];
}

class WeatherKaliningradError extends WeatherKaliningradState {
  final String message;

  const WeatherKaliningradError({required this.message});

  @override
  List<Object> get props => [message];
}
