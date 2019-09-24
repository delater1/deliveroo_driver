import 'package:deliveroo_driver/entities/Stop.dart';
import 'package:flutter/material.dart';

class StopDetails extends StatelessWidget {
  final Stop stop;

  StopDetails(this.stop);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stop details"), centerTitle: true),
      body: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    "${stop.street} ${stop.apartmentNumber}/${stop.streetNumber}"))
          ]),
          Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("${stop.zipCode} ${stop.city}"))
          ]),
        ],
      ),
    );
  }
}
