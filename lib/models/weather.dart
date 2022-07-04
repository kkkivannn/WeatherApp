class Weather {
  final dynamic temperature;
  final String main;
  final String description;
  final String nameTown;
  final dynamic feelsLike;
  final dynamic speedWind;

  Weather(
      {required this.nameTown,
      required this.feelsLike,
      required this.speedWind,
      required this.description,
      required this.main,
      required this.temperature});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        temperature: json['main']['temp'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        feelsLike: json['main']["feels_like"],
        nameTown: json['name'],
        speedWind: json['wind']['speed']);
  }
}
