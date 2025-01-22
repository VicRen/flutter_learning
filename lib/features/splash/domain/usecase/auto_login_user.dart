import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_learning/core/usecase.dart';

import '../../../../core/exceptions.dart';
import '../../../../core/failures.dart';
import '../repositories/auth_repository.dart';

class AutoLoginUser implements UseCase<String, NoParams> {
  final AuthRepository repository;

  AutoLoginUser(this.repository);

  @override
  Future<Either<Failure, String>> call([NoParams? params]) async {
    try {
      final result = await repository.autoLogin('deviceId');
      return Right(result.uid);
    } on ServerException {
      return Left(ServerFailure());
    } on DeviceException {
      return Left(DeviceIdFailure());
    }
  }
}
