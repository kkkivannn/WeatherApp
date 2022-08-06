import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/feature/domain/usecases/sign_in.dart';
import 'package:test_app/feature/presentation/pages/registration/controller/sign_in_state.dart';

import '../../../../../constants.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignIn signIn;

  SignInCubit({required this.signIn}) : super(SignInEmpty());

  Future<void> signInUser(String username, String password) async {
    try {
      emit(SignInLoading());
      final signInOrFailure = await signIn(
          UsernameAndPasswordParams(username: username, password: password));
      signInOrFailure.fold(
          (error) =>
              emit(const SignInError(errorMessage: SERVER_FAILURE_MESSAGE)),
          (userDataEntiti) {
        emit(SignInComplete(userDataEntiti));
      });
    } catch (_) {
      emit(const SignInError(errorMessage: SERVER_FAILURE_MESSAGE));
    }
  }
}
