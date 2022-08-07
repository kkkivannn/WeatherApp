import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/utils/save_tokens.dart';
import 'package:test_app/feature/domain/usecases/sign_in.dart';
import 'package:test_app/feature/presentation/pages/registration/controller/sign_in_state.dart';

import '../../../../../constants.dart';
import '../../home_page.dart/home.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignIn signIn;
  final SignInUtilsRepository signInUtilsRepository = SignInUtilsRepository();

  SignInCubit({required this.signIn}) : super(SignInEmpty());

  Future<void> signInUser(
      String username, String password, BuildContext context) async {
    try {
      emit(SignInLoading());
      final signInOrFailure = await signIn(
          UsernameAndPasswordParams(username: username, password: password));
      signInOrFailure.fold(
          (error) =>
              emit(const SignInError(errorMessage: SERVER_FAILURE_MESSAGE)),
          (userDataEntiti) async {
        await signInUtilsRepository.saveTokens(
            userDataEntiti.accessToken, userDataEntiti.refreshToken);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const CountOfTownWeather(),
            ),
            (route) => false);

        emit(SignInComplete(userDataEntiti));
      });
    } catch (_) {
      emit(const SignInError(errorMessage: SERVER_FAILURE_MESSAGE));
    }
  }
}
