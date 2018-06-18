import 'package:flutter/material.dart';
import 'dart:async';

class DateApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DateWidget(),
    );
  }

}

class DateWidget extends StatefulWidget {
  _DateState createState() => new _DateState();
}

class _DateState extends State<DateWidget> {

  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  Future<Null> _selectDate() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2019)
    );

    if (picked != null && picked != _date) {
      print('Date selected: ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> _selectTime() async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: _time);


    if (picked != null && picked != _time) {
      print('Time selected: ${_time.toString()}');
      setState(() {
        _time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('DateTime Demo'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('Date selected: ${_date.toString()}'),
            new RaisedButton(
                child: new Text('Select Date'),
                onPressed: () {_selectDate();}),
            new Text('Time selected: ${_time.toString()}'),
            new RaisedButton(
                child: new Text('Select Time'),
                onPressed: () {_selectTime();}),
          ],
        ),
      ),
    );
  }

}