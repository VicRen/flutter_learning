import 'package:HelloFlutter/navigator/screens/home.dart';
import 'package:HelloFlutter/navigator/screens/second.dart';
import 'package:HelloFlutter/navigator/screens/third.dart';
import 'package:flutter/material.dart';

class NavigatorApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Navigator',
      routes: <String, WidgetBuilder> {
        '/Home': (BuildContext context) => new Home(),
        '/Second': (BuildContext context) => new Second(),
        '/Third': (BuildContext context) => new Third(),
      },
      home: new Home(),
    );
  }

}