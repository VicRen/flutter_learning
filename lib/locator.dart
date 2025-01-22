import 'package:get_it/get_it.dart';

import 'features/splash/data/repositories/auth_repository_impl.dart';
import 'features/splash/domain/repositories/auth_repository.dart';
import 'features/splash/domain/usecase/auto_login_user.dart';
import 'features/splash/presentation/bloc/splash_bloc.dart';
import 'shared/data/auth_api_client.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // Network
  locator.registerLazySingleton(() => AuthApiClient());

  // Repositories
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator()));

  // Use cases
  locator.registerLazySingleton(() => AutoLoginUser(locator()));

  // Bloc
  locator.registerFactory(() => SplashBloc(locator()));
}
