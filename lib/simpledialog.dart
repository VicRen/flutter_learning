import 'package:flutter/material.dart';
import 'dart:async';

class DialogApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DialogWidget(),
    );
  }

}

class DialogWidget extends StatefulWidget {
  _DialogState createState() => new _DialogState();
}

enum Answer {
  YES,
  NO,
  MAYBE
}

class _DialogState extends State<DialogWidget> {

  String _answer = '';

  void setAnswer(String value) {
    setState(() {
      _answer = value;
    });
  }

  Future<Null> _askuser() async {
    switch (
    await showDialog(
      context: context,
      child: new SimpleDialog(
        title: new Text('Do you like Fultter?'),
        children: <Widget>[
          new SimpleDialogOption(
            onPressed: () {Navigator.pop(context, Answer.YES);},
            child: const Text('YES'),
          ),
          new SimpleDialogOption(
            onPressed: () {Navigator.pop(context, Answer.NO);},
            child: const Text('NO'),
          ),
          new SimpleDialogOption(
            onPressed: () {Navigator.pop(context, Answer.MAYBE);},
            child: const Text('MAYBE'),
          ),
        ],
      )
      )
    ) {
      case Answer.YES:
        setAnswer('yes');
        break;
      case Answer.NO:
        setAnswer('no');
        break;
      case Answer.MAYBE:
        setAnswer('maybe');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Simple Dialog Demo'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('You answerted ${_answer}'),
            new RaisedButton(
                child: new Text('Click me'),
                onPressed: () {_askuser();})
          ],
        ),
      ),
    );
  }

}