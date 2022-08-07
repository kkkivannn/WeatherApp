import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/user_data.dart';

abstract class SignInRepository {
  Future<Either<Failure, UserDataEntiti>> signIn(
      String username, String password);
}
