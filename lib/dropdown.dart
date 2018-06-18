import 'package:flutter/material.dart';

class DropDownApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DropDownWidget(),
    );
  }

}

class DropDownWidget extends StatefulWidget {
  _DropDownState createState() => new _DropDownState();
}

class _DropDownState extends State<DropDownWidget> {

  String _value = null;
  List<String> _values = new List<String>();

  @override
  void initState() {
    _values.addAll(["Vic", "Ren", "Coco"]);
    _value = _values.elementAt(0);
  }

  void _onChanged(String value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('DropDown Demo'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new DropdownButton(
                value: _value,
                items: _values.map((String value) {
                  return new DropdownMenuItem(
                      value: value,
                      child: new Row(
                        children: <Widget>[
                          new Icon(Icons.home),
                          new Text('Person: ${value}')
                        ],
                      ));
                }).toList(),
                onChanged: (String value) {_onChanged(value);}),
          ],
        ),
      ),
    );
  }

}