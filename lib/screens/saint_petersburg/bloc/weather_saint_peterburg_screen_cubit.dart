import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/models/weather.dart';
import 'package:test_app/repositories/get_weather_town.dart';

import 'weather_saint_peterburg_screen_state.dart';

class WeatherSaintPeterburgScreenCubit
    extends Cubit<WeatherSaintPeterburgScreenState> {
  final WeatherRepository _weatherRepository;
  WeatherSaintPeterburgScreenCubit(
      {required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(WeatherScreenEmptyState());

  Future<void> fetchWeather(String nameTown) async {
    try {
      emit(WeatherScreenLodingState());
      final Weather loadedWeatherList =
          await _weatherRepository.getDataWeather(nameTown);
      emit(WeatherScreenLoadedState(loadedWeather: loadedWeatherList));
    } catch (_) {
      emit(WeatherScreenErrorState());
    }
  }
}
