import 'package:flutter_learning/common/navigation/navigation_service.dart';
import 'package:flutter_learning/features/splash/data/repositories/auth_repository_impl.dart';
import 'package:flutter_learning/features/splash/domain/repositories/auth_repository.dart';
import 'package:flutter_learning/shared/data/auth_api_client.dart';
import 'package:get_it/get_it.dart';

import 'features/splash/domain/usecase/auto_login_user.dart';
import 'features/splash/presentation/bloc/splash_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator
      .registerLazySingleton<NavigationService>(() => NavigationServiceImpl());

  locator.registerLazySingleton<AuthApiClient>(() => AuthApiClient());

  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator<AuthApiClient>()));

  locator.registerLazySingleton<AutoLoginUser>(
      () => AutoLoginUser(authRepository: locator<AuthRepository>()));

  locator.registerFactory<SplashBloc>(
      () => SplashBloc(autoLoginUserUseCase: locator<AutoLoginUser>()));
}
