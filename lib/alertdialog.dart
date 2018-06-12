import 'package:flutter/material.dart';

class AlertDialogApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new AlertDialogView(),
    );
  }

}

class AlertDialogView extends StatefulWidget {
  _AlertDialogViewState createState() => new _AlertDialogViewState();
}

enum AlertAction {
  yes,
  no,
  maybe
}

class _AlertDialogViewState extends State<AlertDialogView> {

  String _text;

  void _onChange(String value) {
    if (value.isEmpty) return;
    setState(() {
      _text = value;
    });
  }

  void _dialogResult(AlertAction action) {
    print(action);
    Navigator.pop(context);
  }

  void _onPressed(String value) {
    AlertDialog dialog = new AlertDialog(
      content: new Text(value, style: new TextStyle(fontSize: 30.0),),
      actions: <Widget>[
        new FlatButton(onPressed: () {
          _dialogResult(AlertAction.yes);
        }, child: new Text('Yes')),
        new FlatButton(onPressed: () {
          _dialogResult(AlertAction.no);
        }, child: new Text('No')),
        new FlatButton(onPressed: () {
          _dialogResult(AlertAction.maybe);
        }, child: new Text('Maybe'))
      ],
    );
    showDialog(context: context, child: dialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Alert Dialog'),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(
                onChanged: (String value) {
                  _onChange(value);
                },
              ),
              new RaisedButton(child: new Text('Alert!'),
                  onPressed: () {
                    _onPressed(_text);
                  })
            ],
          ),
        ),
      ),
    );
  }

}