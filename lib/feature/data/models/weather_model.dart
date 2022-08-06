// Project imports:
import 'package:test_app/feature/data/models/coordinates_model.dart';
import 'package:test_app/feature/domain/entities/weather.dart';

class WeatherModel extends WeatherEntiti {
  WeatherModel({
    required temperature,
    required feelsLike,
    required speedWind,
    required description,
    required coordinates,
    required nameTown,
  }) : super(
          temperature: temperature,
          feelsLike: feelsLike,
          speedWind: speedWind,
          description: description,
          coordinates: coordinates,
          nameTown: nameTown,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json['main']['temp'] as dynamic,
      feelsLike: json['main']["feels_like"] as dynamic,
      speedWind: json['wind']['speed'] as dynamic,
      description: json['weather'][0]['description'] as String,
      coordinates: json['coord'] != null
          ? CoordinatesModel.fromJson(json['coord'])
          : null,
      nameTown: json['name'] as String,
    );
  }
}
