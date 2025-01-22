import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> autoLogin(String deviceId);
}
