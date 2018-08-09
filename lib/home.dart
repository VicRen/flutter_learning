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
  List<String> _data = List<String>();

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
      MaterialPageRoute(builder: (context) => ListViewApp()),
    );
  }

  Widget _buildDrawer() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
          child: Image.asset('images/thumb.jpeg'),
        ),
        Text(
          'Vic',
          style: Theme.of(context).textTheme.title,
        ),
        Text(
          '18605745829',
          style: Theme.of(context).textTheme.subhead,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            _popDrawer(DrawerAction.SETTINGS);
          },
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            _popDrawer(DrawerAction.ABOUT);
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('About'),
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
        GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              )
            ],
            pinned: true,
            expandedHeight: 96.0,
            leading: IconButton(
              icon: CircleAvatar(
                child: Text('V'),
                backgroundColor: Colors.amberAccent,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
            ),
            title: Text('Home'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Card(
                child: Container(
                  padding: EdgeInsets.all(32.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('$index'),
                    ),
                    title: Text(_data[index]),
                  ),
                ),
              );
            }),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
            padding: EdgeInsets.all(32.0), child: _buildDrawer()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.multiline_chart),
        backgroundColor: Colors.red,
        onPressed: () {},
      ),
    );
  }
}
