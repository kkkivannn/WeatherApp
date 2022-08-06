// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:test_app/feature/domain/entities/weather.dart';
import 'package:test_app/feature/domain/usecases/get_weather.dart';

part 'weather_kazan_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class WeatherKazanCubit extends Cubit<WeatherKazanState> {
  final GetWeather getWeather;
  WeatherKazanCubit({required this.getWeather}) : super(WeatherKazanEmpty());

  Future<void> fetchWeather(String nameTown) async {
    try {
      emit(WeatherKazanEmpty());
      final loadedWeatherOrFailure =
          await getWeather(NameTownParams(nameTown: nameTown));
      loadedWeatherOrFailure.fold(
          (error) =>
              emit(const WeatherKazanError(message: SERVER_FAILURE_MESSAGE)),
          (weatherEntiti) {
        emit(WeatherKazanLoaded(weatherEntiti));
      });
    } catch (_) {
      emit(const WeatherKazanError(message: SERVER_FAILURE_MESSAGE));
    }
  }
}
