import 'package:flutter/material.dart';

class FlutterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Learning",
      home: new StateHome(),
    );
  }
}

class StateHome extends StatefulWidget {

  @override
  _HomeState createState() => new _HomeState();

}

class _HomeState extends State<StateHome> {

  String title = "Testing";

  void _pressed(String message) {
    setState(() {
      title = message;
    });
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () {
              _pressed("menu");
            }),
        title: new Text("Hello Flutter"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: "Search",
              onPressed: () {
                _pressed("search");
              }),
        ],
      ),
      body: new Center(
        child: new Text(title),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: "Add",
          child: new Icon(Icons.add),
          onPressed: null),
    );
  }

}
