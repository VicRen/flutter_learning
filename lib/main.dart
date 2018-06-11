import 'package:HelloFlutter/animatedlist.dart';
import 'package:HelloFlutter/appbarbasic.dart';
import 'package:HelloFlutter/appbarbottomwidget.dart';
import 'package:HelloFlutter/expansiontitle.dart';
import 'package:HelloFlutter/flutterhome.dart';
import 'package:HelloFlutter/imagepicker.dart';
import 'package:HelloFlutter/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(new FlutterLearning());

class FlutterLearning extends StatefulWidget {

  _FlutterState createState() => new _FlutterState();
}

class _FlutterState extends State<FlutterLearning> {

  String _title = 'Please Login';
  Widget _screen;
  login _login;
  FlutterHome _basicAppbar;
  bool _authenticated;

  _FlutterState() {
    _login = new login(onSubmit: () {
      onSubmit();
    });
    _basicAppbar = new FlutterHome();
    _screen = _login;
  }

  void onSubmit() {
    print('login with ' + _login.username + ' ' + _login.password);
    if (_login.username == 'User' && _login.password == 'password') {
      _setAuthenticated(true);
    }
  }

  void _goHome() {
    setState(() {
      if (_authenticated) {
        _screen = _basicAppbar;
      } else {
        _screen = _login;
      }
    });
  }

  void _logout() {
    _setAuthenticated(false);
  }

  void _setAuthenticated(bool auth) {
    setState(() {
      if (auth) {
        _screen = _basicAppbar;
        _title = 'Welcome';
        _authenticated = true;
      } else {
        _screen = _login;
        _title = 'Please Login';
        _authenticated = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
//    return new MediaQuery(
//        data: new MediaQueryData(),
//        child: new MaterialApp(home: new MyHomePage())
//    );
      return MaterialApp(
        title: 'LoginDemo',
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text(_title),
            actions: <Widget>[
              new IconButton(icon: new Icon(Icons.home), onPressed: () {
                _goHome();
              }),
              new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: () {
                _logout();
              }),
            ],
          ),
          body: _screen,
        ),
      );
  }
}