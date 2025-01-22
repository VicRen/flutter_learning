import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter_learning/locator.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<SplashBloc>()..add(AutoLoginEvent()),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<SplashBloc, SplashState>(
            builder: (context, state) {
              if (state is SplashLoading) {
                return const Text('Loading...');
              } else if (state is SplashLogining) {
                return const Text('Logining...');
              } else if (state is SplashSuccess) {
                return Text('Login Success: ${state.responseBody}');
              } else if (state is SplashFailure) {
                return Text('Login Failed: ${state.errorMessage}');
              } else {
                // 添加默认 UI 组件
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
