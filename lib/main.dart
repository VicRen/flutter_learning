import 'package:HelloFlutter/animatedlist.dart';
import 'package:HelloFlutter/appbarbasic.dart';
import 'package:HelloFlutter/appbarbottomwidget.dart';
import 'package:HelloFlutter/expansiontitle.dart';
import 'package:HelloFlutter/flutterhome.dart';
import 'package:HelloFlutter/imagepicker.dart';
import 'package:flutter/material.dart';

void main() => runApp(new FlutterLearning());

class FlutterLearning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(home: new MyHomePage())
    );
  }
}