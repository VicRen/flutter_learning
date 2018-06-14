import 'package:flutter/material.dart';

class CheckBoxApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new CheckBoxWidget(),
    );
  }

}

class CheckBoxWidget extends StatefulWidget {
  _CheckBoxState createState() => new _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxWidget> {

  bool _isCheck = false;

  void _onChanged(bool value) {
    setState(() {
      _isCheck = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('CheckBox'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Text('Click it'),
                  new Checkbox(value: _isCheck, onChanged: (bool value) {_onChanged(value);})
                ],
              ),
              new CheckboxListTile(
                  title: new Text('Click me'),
                  value: _isCheck,
                  activeColor: Colors.red,
                  secondary: const Icon(Icons.home),
                  onChanged: (bool value) {_onChanged(value);}),
            ],
          ),
        ),
      ),
    );
  }

}