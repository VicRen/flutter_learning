import 'package:flutter/material.dart';
import 'package:flutter_learning/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter_learning/features/splash/presentation/splash_feature.dart';
import 'package:flutter_learning/router/router_name.dart';

import '../locator.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(
            builder: (context) => SplashFeature.buildSplashPage(
                splashBloc: locator<SplashBloc>()));
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No route defined'),
                  ),
                ));
    }
  }
}
