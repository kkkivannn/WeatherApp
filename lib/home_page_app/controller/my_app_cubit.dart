// Package imports:
import 'package:bloc/bloc.dart';

// Project imports:

import 'package:test_app/home_page_app/controller/my_app_state.dart';

import '../../core/utils/save_tokens.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class MyAppCubit extends Cubit<MyAppState> {
  MyAppCubit() : super(MyAppEmptyState());
  final SignInUtilsRepository signInUtilsRepository = SignInUtilsRepository();
  Future<void> getTokens() async {
    try {
      emit(MyAppEmptyState());
      if (await signInUtilsRepository.userHaveTokens()) {
        emit(MyAppNotEmptyState());
      }
    } catch (_) {
      emit(MyAppEmptyState());
    }
  }
}
