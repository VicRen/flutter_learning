import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ImageApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new ImageWidget(),
    );
  }

}

class ImageWidget extends StatefulWidget {
  _ImageState createState() => new _ImageState();
}

class _ImageState extends State<ImageWidget> {

  String _url = 'https://flutter.io/images/intellij/hot-reload.gif';
  bool _showImage = false;

  void _onPressed() {
    setState(() {
      _showImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image Demo'),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new RaisedButton(onPressed: () {_onPressed();}),
              _showImage ? new Image.network(_url) : new Text('Click to load Image'),
            ],
          ),
        ),
      ),
    );
  }

}