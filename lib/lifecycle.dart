import 'package:flutter/material.dart';

class LifeCycleApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LifeCycleWidget(),
    );
  }

}

class LifeCycleWidget extends StatefulWidget {
  _ListCycleState createState() => new _ListCycleState();
}

class _ListCycleState extends State<LifeCycleWidget> with WidgetsBindingObserver {

  @override
  void initState() {
    print('*** init state');
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    print('*** dispose');
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('*** state = ${state.toString()}');
    switch (state) {
      case AppLifecycleState.inactive:
        print('*** inactive');
        break;
      case AppLifecycleState.paused:
        print('*** paused');
        break;
      case AppLifecycleState.resumed:
        print('*** resumed');
        break;
      case AppLifecycleState.suspending:
        print('*** suspending');
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Life Cycle Demo'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('Widget Here')
          ],
        ),
      ),
    );
  }

}