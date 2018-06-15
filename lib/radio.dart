import 'package:flutter/material.dart';

class RadioApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new RadioWidget(),
    );
  }
}

class RadioWidget extends StatefulWidget {
  _RadioState createState() => new _RadioState();
}

class _RadioState extends State<RadioWidget> {

  int _selected = 0;

  void _onChange(int value) {
    setState(() {
      _selected = value;
    });
  }

  List<Widget> makeRadios() {
    List<Widget> list = new List<Widget>();
    for (int i = 0; i < 3; i++) {
      list.add(new Row(
        children: <Widget>[
          new Radio(value: i, groupValue: _selected, onChanged: (int value) {_onChange(value);}),
          new Text('Radio $i'),
        ],
      ));
    }

    for (int i = 0; i < 3; i++) {
      list.add(new RadioListTile(
          title: new Text('Radio $i'),
          activeColor: Colors.red,
          subtitle: new Text('Radio Subtitle $i'),
          secondary: new Icon(Icons.home),
          value: i,
          groupValue: _selected,
          onChanged: (int value) {_onChange(value);}));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Radio'),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: makeRadios()
          ),
        ),
      ),
    );
  }

}