import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/feature/domain/entities/weather.dart';
import 'package:test_app/feature/domain/usecases/get_weather.dart';

part 'weather_moscow_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class WeatherMoscowCubit extends Cubit<WeatherMoscowState> {
  final GetWeather getWeather;
  WeatherMoscowCubit({required this.getWeather}) : super(WeatherMoscowEmpty());

  Future<void> fetchWeather(String nameTown) async {
    try {
      emit(WeatherMoscowEmpty());
      final loadedWeatherOrFailure =
          await getWeather(NameTownParams(nameTown: nameTown));
      loadedWeatherOrFailure.fold(
          (error) =>
              emit(const WeatherMoscowError(message: SERVER_FAILURE_MESSAGE)),
          (weatherEntiti) {
        emit(WeatherMoscowLoaded(weatherEntiti));
      });
    } catch (_) {
      emit(const WeatherMoscowError(message: SERVER_FAILURE_MESSAGE));
    }
  }
}
