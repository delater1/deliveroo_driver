import 'package:flutter/material.dart';

import 'StopList.dart';
import 'Map.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Deliveroo"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HomePageIcon(Icon(Icons.airport_shuttle), "Stops", StopList()),
            HomePageIcon(Icon(Icons.map), "Map", Map())
          ],
        )));
  }
}

class HomePageIcon extends StatelessWidget {
  final Icon icon;
  final String title;
  final Widget nextPage;

  const HomePageIcon(this.icon, this.title, this.nextPage);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(
        icon: icon,
        iconSize: 64,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
        },
      ),
      Text(title,
          style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
    ]);
  }
}
