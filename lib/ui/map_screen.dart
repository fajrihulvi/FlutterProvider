import 'package:amr_apps/ui/widget/maps.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  final String lat,long;

  const MapScreen({this.lat, this.long});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
    child: Column(
    mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
            fit: FlexFit.loose,
            child:
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: MapsScreen(lat: this.widget.lat,long: this.widget.long,),
            )),
      ],
    ),
    ),
    ));
  }
}
