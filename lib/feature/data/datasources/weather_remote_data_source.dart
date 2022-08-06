// Project imports:

import 'package:test_app/feature/data/models/user_data_model.dart';
import 'package:test_app/feature/data/models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(String nameTown);
  Future<UserDataModel> signIn(String username, String password);
}
