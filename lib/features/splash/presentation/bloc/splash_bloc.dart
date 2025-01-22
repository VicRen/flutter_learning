import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/auto_login_user.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AutoLoginUser autoLoginUser;

  SplashBloc(this.autoLoginUser) : super(SplashInitial()) {
    on<AutoLoginEvent>((event, emit) async {
      emit(SplashLoading());
      try {
        emit(SplashLogining());
        final result = await autoLoginUser.call();
        result.fold(
          (failure) => emit(SplashFailure(errorMessage: failure.toString())),
          (responseBody) => emit(SplashSuccess(responseBody: responseBody)),
        );
      } catch (e) {
        emit(SplashFailure(errorMessage: e.toString()));
      }
    });
  }
}
