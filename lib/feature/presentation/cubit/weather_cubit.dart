import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/feature/domain/entities/weather.dart';
import 'package:test_app/feature/domain/usecases/get_weather.dart';

part 'weather_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeather getWeather;
  WeatherCubit({required this.getWeather}) : super(WeatherEmpty());

  Future<void> fetchWeather(String nameTown) async {
    try {
      emit(WeatherEmpty());
      final loadedWeatherOrFailure =
          await getWeather(NameTownParams(nameTown: nameTown));
      loadedWeatherOrFailure.fold(
          (error) => emit(const WeatherError(message: SERVER_FAILURE_MESSAGE)),
          (weatherEntiti) {
        emit(WeatherLoaded(weatherEntiti));
      });
    } catch (_) {
      emit(const WeatherError(message: SERVER_FAILURE_MESSAGE));
    }
  }
}
