import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/core/usecases/usecase.dart';
import 'package:test_app/feature/domain/entities/user_data.dart';
import 'package:test_app/feature/domain/repositories/sign_in.dart';

class SignIn implements UseCase<UserDataEntiti, UsernameAndPasswordParams> {
  final SignInRepository signInRepository;

  SignIn(this.signInRepository);
  @override
  Future<Either<Failure, UserDataEntiti>> call(
      UsernameAndPasswordParams params) async {
    return await signInRepository.signIn(params.username, params.password);
  }
}

class UsernameAndPasswordParams extends Equatable {
  final String username;
  final String password;
  const UsernameAndPasswordParams({
    required this.password,
    required this.username,
  });

  @override
  List<Object?> get props => [username, password];
}
