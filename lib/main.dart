import 'package:flutter/material.dart';

import 'package:deliveroo_driver/ui/HomePage.dart';

void main() => runApp(MainMenu());

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deliveroo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


