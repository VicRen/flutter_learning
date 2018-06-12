import 'package:flutter/material.dart';

class SnackBarApp extends StatefulWidget {

  _SnackBarState createState() => new _SnackBarState();
}

class _SnackBarState extends State<SnackBarApp> {

  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();

  String _text = '';

  void _onChange(String value) {
    setState(() {
      _text = value;
    });
  }

  void _showSnackBar(String value) {
    if (value.isEmpty) return;
    _scaffoldState.currentState.showSnackBar(new SnackBar(content: new Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldState,
      appBar: new AppBar(
        title: new Text('SnackBar'),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(onChanged: (String value) {_onChange(value);},),
              new RaisedButton(child: new Text('SanckBar!'), onPressed: () {_showSnackBar(_text);})
            ],
          ),
        ),
      ),
    );
  }

}