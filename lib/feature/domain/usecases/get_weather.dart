// Package imports:
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/core/usecases/usecase.dart';
import 'package:test_app/feature/domain/entities/weather.dart';
import 'package:test_app/feature/domain/repositories/weather.dart';

class GetWeather implements UseCase<WeatherEntiti, NameTownParams> {
  final WeatherRepository weatherRepository;

  GetWeather(this.weatherRepository);
  @override
  Future<Either<Failure, WeatherEntiti>> call(NameTownParams params) async {
    return await weatherRepository.getWeather(params.nameTown);
  }
}

class NameTownParams extends Equatable {
  final String nameTown;

  const NameTownParams({required this.nameTown});
  @override
  List<Object?> get props => [nameTown];
}
