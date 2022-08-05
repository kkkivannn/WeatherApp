import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/feature/domain/entities/weather.dart';
import 'package:test_app/feature/domain/usecases/get_weather.dart';

part 'weather_sochi_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class WeatherSochiCubit extends Cubit<WeatherSochiState> {
  final GetWeather getWeather;
  WeatherSochiCubit({required this.getWeather}) : super(WeatherSochiEmpty());

  Future<void> fetchWeather(String nameTown) async {
    try {
      emit(WeatherSochiEmpty());
      final loadedWeatherOrFailure =
          await getWeather(NameTownParams(nameTown: nameTown));
      loadedWeatherOrFailure.fold(
          (error) =>
              emit(const WeatherSochiError(message: SERVER_FAILURE_MESSAGE)),
          (weatherEntiti) {
        emit(WeatherSochiLoaded(weatherEntiti));
      });
    } catch (_) {
      emit(const WeatherSochiError(message: SERVER_FAILURE_MESSAGE));
    }
  }
}
