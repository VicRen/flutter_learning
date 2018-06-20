import 'package:flutter/material.dart';

class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new TestingWidget(),
    );
  }
  
}

class TestingWidget extends StatefulWidget {
  _TestingState createState() => new _TestingState();
}

class _TestingState extends State<TestingWidget> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Testing'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Hello'),
              new Text('VSCode!')
            ],
          )
        ),
      ),
    );
  }

}