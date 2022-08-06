// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:test_app/core/error/exception.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/feature/data/datasources/weather_remote_data_source.dart';
import 'package:test_app/feature/data/models/user_data_model.dart';
import 'package:test_app/feature/data/models/weather_model.dart';
import 'package:test_app/feature/domain/entities/user_data.dart';
import 'package:test_app/feature/domain/entities/weather.dart';
import 'package:test_app/feature/domain/repositories/weather.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, WeatherEntiti>> getWeather(String nameTown) async {
    return await _getWeather(() {
      return remoteDataSource.getWeather(nameTown);
    });
  }

  Future<Either<Failure, WeatherModel>> _getWeather(
      Future<WeatherModel> Function() getWeather) async {
    try {
      final remoteWeather = await getWeather();
      return Right(remoteWeather);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserDataEntiti>> signIn(
      String username, String password) async {
    return await _signIn(() {
      return remoteDataSource.signIn(username, password);
    });
  }

  Future<Either<Failure, UserDataModel>> _signIn(
      Future<UserDataModel> Function() userData) async {
    try {
      final userDataModel = await userData();
      return Right(userDataModel);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
