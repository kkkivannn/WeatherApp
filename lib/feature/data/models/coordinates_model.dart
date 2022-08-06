// Project imports:
import 'package:test_app/feature/domain/entities/coordinates.dart';

class CoordinatesModel extends CoordinatesEntiti {
  CoordinatesModel({
    required double lon,
    required double lat,
  }) : super(
          lon: lon,
          lat: lat,
        );

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(
      lon: json['lon'],
      lat: json['lat'],
    );
  }
}
