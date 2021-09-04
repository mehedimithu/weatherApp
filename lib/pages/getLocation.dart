import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GetLocation extends StatefulWidget {

  @override
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {

  void getLocations()async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);


  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
