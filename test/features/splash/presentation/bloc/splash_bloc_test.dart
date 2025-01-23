import 'package:dartz/dartz.dart';
import 'package:flutter_learning/common/navigation/navigation_service.dart';
import 'package:flutter_learning/core/failures.dart';
import 'package:flutter_learning/features/splash/domain/usecase/auto_login_user.dart';
import 'package:flutter_learning/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAutoLoginUser extends Mock implements AutoLoginUser {}

class MockNavigationService extends Mock implements NavigationService {}

void main() {
  late SplashBloc bloc;
  late MockAutoLoginUser mockAutoLoginUser;
  late MockNavigationService mockNavigationService;

  setUp(() {
    mockAutoLoginUser = MockAutoLoginUser();
    mockNavigationService = MockNavigationService();
    bloc = SplashBloc(mockAutoLoginUser, mockNavigationService);
  });

  test('initialState should be SplashInitial', () {
    expect(bloc.state, equals(SplashInitial()));
  });

  group('AutoLoginEvent', () {
    test('should call AutoLoginUser', () async {
      when(() => mockAutoLoginUser.call(any()))
          .thenAnswer((_) async => Right('responseBody'));
      bloc.add(AutoLoginEvent());
      await untilCalled(() => mockAutoLoginUser.call(any()));
      verify(() => mockAutoLoginUser.call(any()));
    });
    test(
      'should emit [SplashLoading, SplashLogining, SplashSuccess] when auto login is successful',
      () async {
        // arrange
        when(() => mockAutoLoginUser.call(any()))
            .thenAnswer((_) async => const Right('responseBody'));
        // assert later
        final expected = [
          SplashLoading(),
          SplashLogining(),
          const SplashSuccess(responseBody: 'responseBody'),
        ];
        expectLater(bloc.stream, emitsInOrder(expected));
        // act
        bloc.add(AutoLoginEvent());
      },
    );
    test(
      'should emit [SplashLoading, SplashLogining, SplashFailure] when auto login fails',
      () async {
        // arrange
        when(() => mockAutoLoginUser.call(any()))
            .thenAnswer((_) async => Left(ServerFailure()));
        // assert later
        final expected = [
          SplashLoading(),
          SplashLogining(),
          SplashFailure(errorMessage: ServerFailure().toString()),
        ];
        expectLater(bloc.stream, emitsInOrder(expected));
        // act
        bloc.add(AutoLoginEvent());
      },
    );
  });
}
