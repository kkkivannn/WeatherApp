import 'package:http/http.dart' as https;
import 'dart:convert';

import 'package:test_app/models/weather.dart';

class WeatherRepository {
  Future<Weather> getDataWeather(String nameTown) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$nameTown&units=metric&appid=4f835643d7ff653f90b1686997a64d12');
    var response = await https.get(url);
    if (response.statusCode == 200) {
      final weatherJson = Weather.fromJson(jsonDecode(response.body));
      return weatherJson;
    } else {
      throw Exception('Error, I can t get Weather, Sorry   :((((');
    }
  }
}
