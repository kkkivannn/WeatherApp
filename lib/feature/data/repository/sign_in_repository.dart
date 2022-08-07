import 'package:test_app/feature/data/datasources/weather_remote_data_source.dart';
import 'package:test_app/feature/domain/entities/user_data.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:test_app/feature/domain/repositories/sign_in.dart';

import '../../../core/error/exception.dart';
import '../models/user_data_model.dart';

class SignInRepositoryImpl implements SignInRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;

  SignInRepositoryImpl(this.weatherRemoteDataSource);

  @override
  Future<Either<Failure, UserDataEntiti>> signIn(
      String username, String password) async {
    return await _signIn(() {
      return weatherRemoteDataSource.signIn(username, password);
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
