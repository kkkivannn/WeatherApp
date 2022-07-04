import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/screens/kaliningrad/bloc/weather_kaliningrad_screen_state.dart';
import 'package:test_app/models/weather.dart';
import 'package:test_app/repositories/get_weather_town.dart';

class WeatherKaliningradScreenCubit
    extends Cubit<WeatherKaliningradScreenState> {
  final WeatherRepository _weatherRepository;
  WeatherKaliningradScreenCubit({required WeatherRepository weatherRepository})
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
