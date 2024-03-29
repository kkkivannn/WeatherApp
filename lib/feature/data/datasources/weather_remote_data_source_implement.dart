// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as https;

// Project imports:
import 'package:test_app/core/error/exception.dart';
import 'package:test_app/feature/data/datasources/weather_remote_data_source.dart';
import 'package:test_app/feature/data/models/user_data_model.dart';
import 'package:test_app/feature/data/models/weather_model.dart';

class WeatherRemoteDataSourceImplemet implements WeatherRemoteDataSource {
  @override
  Future<WeatherModel> getWeather(String nameTown) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$nameTown&units=metric&appid=4f835643d7ff653f90b1686997a64d12');
    var response = await https.get(url);
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserDataModel> signIn(String username, String password) async {
    Uri url = Uri.parse('https://api.delivery.spichka.dev/authentication');
    var response = await https.post(url, body: {
      'username': username,
      'password': password,
    });
    if (response.statusCode == 201) {
      return UserDataModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
