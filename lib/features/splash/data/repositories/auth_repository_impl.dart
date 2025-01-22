import 'package:flutter_learning/features/splash/domain/entities/user.dart';
import 'package:flutter_learning/shared/data/auth_api_client.dart';
import 'package:flutter_learning/shared/data/models/user_model.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiClient _apiClient;

  AuthRepositoryImpl(this._apiClient);

  @override
  Future<User> autoLogin(String deviceId) async {
    try {
      final UserModel userModel = await _apiClient.autoLogin(deviceId);
      return User(uid: userModel.uid, description: 'I got the User!');
    } catch (e) {
      rethrow;
    }
  }
}
