import 'package:flutter/material.dart';

class SliderApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new SliderWidget(),
    );
  }

}

class SliderWidget extends StatefulWidget {
  _SliderState createState() => new _SliderState();
}

class _SliderState extends State<SliderWidget> {

  double _value = 0.0;

  void _onChanged(double value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Slider'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('Slider value is ${_value.round()}'),
            new Slider(
                value: _value,
                min: 0.0,
                max: 100.0,
                onChanged: (double value) {_onChanged(value);}),
            new Text('Progress value is ${_value * .01}'),
            new LinearProgressIndicator(
              value: _value * .01,
            )

          ],
        ),
      ),
    );
  }

}