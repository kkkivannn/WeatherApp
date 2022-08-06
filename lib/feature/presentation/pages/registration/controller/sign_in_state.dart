import 'package:equatable/equatable.dart';
import 'package:test_app/feature/domain/entities/user_data.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInEmpty extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInLoading extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInComplete extends SignInState {
  final UserDataEntiti userDataEntiti;

  const SignInComplete(this.userDataEntiti);
  @override
  List<Object> get props => [userDataEntiti];
}

class SignInError extends SignInState {
  final String errorMessage;

  const SignInError({required this.errorMessage});
  @override
  List<Object> get props => [];
}
