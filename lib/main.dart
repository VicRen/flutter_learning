import 'package:flutter/material.dart';
import 'package:flutter_learning/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter_learning/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashPage(),
      title: 'Flutter Learning App',
    );
  }
}
