import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/feature/domain/entities/weather.dart';
import 'package:test_app/feature/domain/usecases/get_weather.dart';

part 'weather_saint_peterburg_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class WeatherSaintPeterburgCubit extends Cubit<WeatherSaintPeterburgState> {
  final GetWeather getWeather;
  WeatherSaintPeterburgCubit({required this.getWeather})
      : super(WeatherSaintPeterburgEmpty());

  Future<void> fetchWeather(String nameTown) async {
    try {
      emit(WeatherSaintPeterburgEmpty());
      final loadedWeatherOrFailure =
          await getWeather(NameTownParams(nameTown: nameTown));
      loadedWeatherOrFailure.fold(
          (error) => emit(const WeatherSaintPeterburgError(
              message: SERVER_FAILURE_MESSAGE)), (weatherEntiti) {
        emit(WeatherSaintPeterburgLoaded(weatherEntiti));
      });
    } catch (_) {
      emit(const WeatherSaintPeterburgError(message: SERVER_FAILURE_MESSAGE));
    }
  }
}
