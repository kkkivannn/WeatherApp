// Project imports:
import 'package:test_app/feature/data/models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(String nameTown);
}
