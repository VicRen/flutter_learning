import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/common/navigation/navigation_service.dart';

import '../../../../core/failures.dart';
import '../../domain/usecase/auto_login_user.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AutoLoginUser autoLoginUser;
  final NavigationService navigationService;

  SplashBloc(this.autoLoginUser, this.navigationService)
      : super(SplashInitial()) {
    on<AutoLoginEvent>((event, emit) async {
      emit(SplashLoading());
      await Future.delayed(const Duration(seconds: 3));
      try {
        emit(SplashLogining());
        final result = await autoLoginUser.call();
        result.fold(
          (failure) {
            if (failure is ServerFailure) {
              emit(const SplashFailure(errorMessage: '服务器错误，请稍后再试。'));
            } else if (failure is DeviceIdFailure) {
              emit(const SplashFailure(errorMessage: '无法获取设备 ID，请重试。'));
            } else {
              emit(const SplashFailure(errorMessage: '未知错误，请稍后再试。'));
            }
          },
          (responseBody) {
            emit(SplashSuccess(responseBody: responseBody));
            // navigationService.navigateToReplacement('/home');
          },
        );
      } catch (e) {
        emit(SplashFailure(errorMessage: e.toString()));
      }
    });
  }
}
