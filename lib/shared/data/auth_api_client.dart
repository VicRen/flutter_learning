import 'package:dio/dio.dart';
import 'package:flutter_learning/core/exceptions.dart';

import 'models/user_model.dart';

class AuthApiClient {
  final Dio _dio = Dio();

  Future<UserModel> autoLogin(String deviceId) async {
    try {
      final response = await _dio.get('dart.dev/f/packages/http.json');
      if (response.statusCode != 200) {
        print('Failed to retrieve the http package!');
        throw ServerException();
      }
      return UserModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
