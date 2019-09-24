import 'package:deliveroo_driver/entities/Stop.dart';
import 'package:deliveroo_driver/ui/StopDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StopList extends StatefulWidget {
  @override
  State<StopList> createState() => StopListState();
}

class StopListState extends State<StopList> {
  List<Stop> stops = [
    Stop("-", "16", "Heleny Motykówny", "Wrocław", "51-209", 123.0, 2.0),
    Stop("-", "16", "Heleny Motykówny", "Wrocław", "51-209", 123.0, 2.0),
    Stop("-", "16", "Heleny Motykówny", "Wrocław", "51-209", 123.0, 2.0),
    Stop("-", "16", "Heleny Motykówny", "Wrocław", "51-209", 123.0, 2.0),
    Stop("-", "16", "Heleny Motykówny", "Wrocław", "51-209", 123.0, 2.0),
    Stop("-", "16", "Heleny Motykówny", "Wrocław", "51-209", 123.0, 2.0),
    Stop("-", "16", "Heleny Motykówny", "Wrocław", "51-209", 123.0, 2.0),
    Stop("-", "16", "Heleny Motykówny", "Wrocław", "51-209", 123.0, 2.0),
    Stop("-", "16", "Heleny Motykówny", "Wrocław", "51-209", 123.0, 2.0)
  ];
  List<Stop> selectedStops = List();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Stops"),
              centerTitle: true,
              bottom: TabBar(tabs: [
                Tab(
                  text: "Pending",
                ),
                Tab(
                  text: "Active",
                ),
                Tab(
                  text: "Completed",
                ),
              ]),
            ),
            body: TabBarView(children: <Widget>[
              getStopsListView(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_transit)
            ])));
  }

  List<LatLng> getSelectedStopsLatLngs() {
    return selectedStops.map((x) => LatLng(x.latitude, x.longitude)).toList(growable: true);
  }

  ListView getStopsListView() {
    return ListView.separated(
      itemCount: stops.length,
      itemBuilder: (context, index) {
        var stop = stops[index];
        bool isSelected = selectedStops.contains(stop);
        return ListTile(
          leading: Icon(
            Icons.directions_car,
            size: 32,
          ),
          title: Text(
              "${stop.street.toUpperCase()} ${stop.streetNumber.toUpperCase()}/${stop.apartmentNumber.toUpperCase()}",
              style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          subtitle: Text("${stop.city.toUpperCase()}"),
          selected: isSelected,
          trailing: Checkbox(
            onChanged: (bool value) {
              setState(() {
                if (value) {
                  selectedStops.add(stop);
                } else {
                  selectedStops.remove(stop);
                }
              });
            },
            value: isSelected,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StopDetails(stop)),
            );
          },
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
    );
  }
}
