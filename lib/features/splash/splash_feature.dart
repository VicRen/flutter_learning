import 'package:flutter/material.dart';
import 'package:flutter_learning/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter_learning/features/splash/presentation/pages/splash_page.dart';

class SplashFeature {
  static Widget buildSplashPage({required SplashBloc splashBloc}) {
    return SplashPage(splashBloc: splashBloc);
  }
}
