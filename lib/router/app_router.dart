import 'package:flutter/material.dart';
import 'package:flutter_learning/features/splash/splash_feature.dart';
import 'package:flutter_learning/locator.dart';
import 'package:flutter_learning/router/router_name.dart';

import '../features/home/presentation/home_page.dart';
import '../features/splash/presentation/bloc/splash_bloc.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(
            builder: (context) => SplashFeature.buildSplashPage(
                splashBloc: locator<SplashBloc>()));
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
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
