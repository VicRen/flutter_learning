import 'package:flutter/material.dart';

class SwitchApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new SwitchWidget(),
    );
  }

}

class SwitchWidget extends StatefulWidget {
  _SwitchStat createState() => new _SwitchStat();
}

class _SwitchStat extends State<SwitchWidget> {

  bool _value = false;

  void _onChanged(bool value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Switch'),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Switch(value: _value, onChanged: (bool value) {_onChanged(value);}),
              new SwitchListTile(
                  activeColor: Colors.red,
                  secondary: const Icon(Icons.home),
                  title: new Text('SiwtchList'),
                  value: _value,
                  onChanged: (bool value) {_onChanged(value);}),
            ],
          ),
        ),
      ),
    );
  }

}