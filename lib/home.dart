import 'package:HelloFlutter/listview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum DrawerAction {
  SETTINGS,
  ABOUT,
}

class _HomePageState extends State<HomePage> {
  List<String> _data = new List<String>();

  @override
  void initState() {
    super.initState();
    setState(() {
      for (int i = 0; i < 10; i++) {
        _data.add('Vic $i');
      }
    });
  }

  void _popDrawer(DrawerAction drawerAction) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new ListViewApp()),
    );
  }

  Widget _buildDrawer() {
    return new Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
          child: new Image.asset('images/thumb.jpeg'),
        ),
        new Text(
          'Vic',
          style: Theme.of(context).textTheme.title,
        ),
        new Text(
          '18605745829',
          style: Theme.of(context).textTheme.subhead,
        ),
        new Divider(),
        new ListTile(
          leading: new Icon(Icons.settings),
          title: new Text('Settings'),
          onTap: () {
            _popDrawer(DrawerAction.SETTINGS);
          },
        ),
        new ListTile(
          leading: new Icon(Icons.home),
          title: new Text('Home'),
          onTap: () {
            _popDrawer(DrawerAction.ABOUT);
          },
        ),
        new ListTile(
          leading: new Icon(Icons.info),
          title: new Text('About'),
          onTap: () {
            _popDrawer(DrawerAction.ABOUT);
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.search),
                onPressed: () {},
              ),
              new IconButton(
                icon: new Icon(Icons.more_vert),
                onPressed: () {},
              )
            ],
            pinned: true,
            expandedHeight: 96.0,
            leading: new IconButton(
              icon: new CircleAvatar(
                child: new Text('V'),
                backgroundColor: Colors.amberAccent,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
            ),
            title: new Text('Home'),
          ),
          new SliverList(
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return new Card(
                child: new Container(
                  padding: EdgeInsets.all(32.0),
                  child: new ListTile(
                    leading: new CircleAvatar(
                      child: new Text('$index'),
                    ),
                    title: new Text(_data[index]),
                  ),
                ),
              );
            }),
          )
        ],
      ),
      drawer: new Drawer(
        child: new Container(
            padding: new EdgeInsets.all(32.0), child: _buildDrawer()),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.multiline_chart),
        backgroundColor: Colors.red,
        onPressed: () {},
      ),
    );
  }
}
