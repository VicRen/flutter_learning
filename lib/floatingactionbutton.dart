import 'package:flutter/material.dart';

class FloatingButtonApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new FloatingButtonWidget(),
    );
  }

}

class FloatingButtonWidget extends StatefulWidget {
  _FloatingButtonState createState() => new _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButtonWidget> {

  String _lastpress = 'never';

  void _onPressed() {
    setState(() {
      DateTime current = new DateTime.now();
      _lastpress = current.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Floating Button Demo'),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.timer),
          backgroundColor: Colors.red,
          onPressed: () {_onPressed();}),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('Last pressed: ${_lastpress}')
          ],
        ),
      ),
    );
  }

}