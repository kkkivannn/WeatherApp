// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:test_app/feature/domain/entities/weather.dart';
import 'package:test_app/feature/domain/usecases/get_weather.dart';

part 'weather_kaliningrad_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class WeatherKaliningradCubit extends Cubit<WeatherKaliningradState> {
  final GetWeather getWeather;
  WeatherKaliningradCubit({required this.getWeather})
      : super(WeatherKaliningradEmpty());

  Future<void> fetchWeather(String nameTown) async {
    try {
      emit(WeatherKaliningradEmpty());
      final loadedWeatherOrFailure =
          await getWeather(NameTownParams(nameTown: nameTown));
      loadedWeatherOrFailure.fold(
          (error) => emit(
              const WeatherKaliningradError(message: SERVER_FAILURE_MESSAGE)),
          (weatherEntiti) {
        emit(WeatherKaliningradLoaded(weatherEntiti));
      });
    } catch (_) {
      emit(const WeatherKaliningradError(message: SERVER_FAILURE_MESSAGE));
    }
  }
}
