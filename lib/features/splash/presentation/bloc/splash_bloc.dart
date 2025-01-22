import 'package:bloc/bloc.dart';
import 'package:flutter_learning/features/splash/domain/usecase/auto_login_user.dart';
import 'package:flutter_learning/features/splash/presentation/bloc/splash_event.dart';
import 'package:flutter_learning/features/splash/presentation/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AutoLoginUser autoLoginUserUseCase;

  SplashBloc({required this.autoLoginUserUseCase}) : super(SplashInitial()) {
    on<SplashInitialized>(event, emit) async {
      try {
        final user = await autoLoginUserUseCase.call(
            AutoLoginParams(deviceId: 'deviceId'));
        emit(AutoLoginSuccessState());
        print('自动登录成功: ${user.uid}');
      } catch (e) {
        print('自动登录异常: $e');
      }
    }
  }
}
