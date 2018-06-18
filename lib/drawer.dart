import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DrawerWidget(),
    );
  }
}

class DrawerWidget extends StatefulWidget {
  _DrawerState createState() => new _DrawerState();
}

class _DrawerState extends State<DrawerWidget> {

  void _onPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Drawer Demo'),
      ),
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Text('Hello Drawer'),
              new RaisedButton(
                  color: Colors.red,
                  child: new Text('Close'),
                  onPressed: () {_onPressed();}),
            ],
          ),
        ),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('Widget Here')
          ],
        ),
      ),
    );
  }
}