import 'package:flutter/material.dart';

class ListViewApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new ListViewWidget(),
    );
  }

}

class ListViewWidget extends StatefulWidget {
  _ListState createState() => new _ListState();
}

class _ListState extends State<ListViewWidget> {

  List<bool> _data = new List<bool>();

  @override
  void initState() {
    super.initState();
    setState(() {
      for (int i = 0; i < 10; i++) {
        _data.add(false);
      }
    });
  }

  void _onChanged(bool value, int index) {
    setState(() {
      _data[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListView Demo')
      ),
      body: new ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new Container(
                padding: EdgeInsets.all(32.0),
                child: new Column(
                  children: <Widget>[
                    new Text('This is tiem ${index}'),
                    new CheckboxListTile(
                        value: _data[index],
                        controlAffinity: ListTileControlAffinity.leading,
                        title: new Text('Click me item ${index}'),
                        onChanged: (bool value) {_onChanged(value, index);})
                  ],
                ),
              ),
            );
          }
      ),
    );
  }

}