part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLogining extends SplashState {}

class SplashSuccess extends SplashState {
  final String responseBody;

  const SplashSuccess({required this.responseBody});

  @override
  List<Object> get props => [responseBody];
}

class SplashFailure extends SplashState {
  final String errorMessage;

  const SplashFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
