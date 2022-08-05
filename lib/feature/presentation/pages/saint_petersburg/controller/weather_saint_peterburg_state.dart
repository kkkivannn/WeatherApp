part of 'weather_saint_peterburg_cubit.dart';

abstract class WeatherSaintPeterburgState extends Equatable {
  const WeatherSaintPeterburgState();

  @override
  List<Object> get props => [];
}

class WeatherSaintPeterburgEmpty extends WeatherSaintPeterburgState {
  @override
  List<Object> get props => [];
}

class WeatherSaintPeterburgLoading extends WeatherSaintPeterburgState {
  final List<WeatherEntiti> oldWeather;
  final bool isFirstFetch;

  const WeatherSaintPeterburgLoading(this.oldWeather,
      {this.isFirstFetch = false});
  @override
  List<Object> get props => [oldWeather];
}

class WeatherSaintPeterburgLoaded extends WeatherSaintPeterburgState {
  final WeatherEntiti weather;

  const WeatherSaintPeterburgLoaded(this.weather);
  @override
  List<Object> get props => [weather];
}

class WeatherSaintPeterburgError extends WeatherSaintPeterburgState {
  final String message;

  const WeatherSaintPeterburgError({required this.message});

  @override
  List<Object> get props => [message];
}
