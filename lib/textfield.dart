import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new TextFiledWidget(),
    );
  }

}

class TextFiledWidget extends StatefulWidget {
  _TextFieldWidgetState createState() => new _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFiledWidget> {

  String _text = '';

  void _onChanged(String value) {
    setState(() {
      _text = value;
    });
  }

  void _onPressed(String text) {

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Text Field'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              onChanged: (String value) {_onChanged(value);},
            ),
            new RaisedButton(child: new Text(_text),
                onPressed: () {_onPressed(_text);})
          ],
        ),
      ),
    );
  }

}