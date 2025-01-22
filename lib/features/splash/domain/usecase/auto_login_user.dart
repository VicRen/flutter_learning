import 'dart:async';

import 'package:flutter_learning/core/usecase.dart';

import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class AutoLoginUser extends UseCase<User, AutoLoginParams> {
  final AuthRepository _authRepository;

  AutoLoginUser({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  FutureOr<User> call(AutoLoginParams params) {
    return _authRepository.autoLogin(params.deviceId);
  }
}

class AutoLoginParams {
  final String deviceId;

  AutoLoginParams({required this.deviceId});
}
