import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/features/splash/presentation/pages/splash_page.dart';

import 'bloc/splash_bloc.dart';

class SplashFeature {
  static Widget buildSplashPage({required SplashBloc splashBloc}) {
    // 接收 BLoC 实例作为参数
    return BlocProvider<SplashBloc>(
      create: (context) => splashBloc, // 直接使用传入的 BLoC 实例
      child: const SplashPage(),
    );
  }
}
