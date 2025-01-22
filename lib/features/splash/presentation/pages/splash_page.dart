import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/splash_bloc.dart';
import '../bloc/splash_event.dart';
import '../bloc/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();

    // 启动 1 秒定时器
    _timer = Timer(const Duration(seconds: 1), () {
      if (!_hasNavigated) {
        // locator<NavigationService>().navigateToHome();
        // _hasNavigated = true;
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 启动自动登录，必须在 didChangeDependencies 中调用，以确保 context 可用
    BlocProvider.of<SplashBloc>(context).add(SplashInitialized());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is AutoLoginSuccessState && !_hasNavigated) {
          _timer?.cancel(); // 取消定时器
          // locator<NavigationService>().navigateToHome();
          // _hasNavigated = true;
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
