import 'package:flutter/material.dart';

abstract class NavigationService {
  GlobalKey<NavigatorState> get navigationKey;

  Future<dynamic> navigateTo(String routeName, {Object? arguments});
  Future<dynamic> navigateToReplacement(String routeName, {Object? arguments});
  void goBack();
}

class NavigationServiceImpl implements NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigationKey => _navigatorKey;

  @override
  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return _navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> navigateToReplacement(String routeName, {Object? arguments}) {
    return _navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  @override
  void goBack() {
    return _navigatorKey.currentState!.pop();
  }
}
