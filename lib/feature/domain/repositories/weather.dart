// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/feature/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntiti>> getWeather(String nameTown);
}
