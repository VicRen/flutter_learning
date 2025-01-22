import 'package:flutter_learning/common/navigation/navigation_service.dart';

class SplashNavigationService {
  final NavigationService _navigationService;

  SplashNavigationService(this._navigationService);

  void navigateToHome() {
    _navigationService.navigateTo('/home');
  }
}
