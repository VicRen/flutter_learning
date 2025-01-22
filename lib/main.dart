import 'package:flutter/material.dart';
import 'package:flutter_learning/common/navigation/navigation_service.dart';
import 'package:flutter_learning/router/app_router.dart';
import 'package:flutter_learning/router/router_name.dart';

import 'locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: di.locator<NavigationService>().navigationKey,
      initialRoute: RouteName.splash,
      onGenerateRoute: AppRouter.generateRoute, // 处理动态路由
      onUnknownRoute: (settings) => MaterialPageRoute(
        // 处理未知路由
        builder: (context) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
      ),
      title: 'Flutter Learning',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
