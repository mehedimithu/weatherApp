import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/forecast/model/forecast_model.dart';
import 'package:weather_app/models/locations.dart';
import 'package:http/http.dart' as http;

const apiKey = '032dbc88c111154959aaffb1a0103112';

class GetLocation extends StatefulWidget {
  @override
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  double? latitude;
  double? longitude;

  void getLocations() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
  }

  Future<ForcastModel?> getData() async {
    final queryParameters = {
      'lat': latitude.toString(),
      'lon': latitude.toString(),
      'exclude': 'hourly',
      'appid': apiKey,
      'units': 'imperial'
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/onecall', queryParameters);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print(response.body);
      return ForcastModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error code: ${response.statusCode}");
    }
  }

  @override
  void initState() {
    getLocations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(),
      ),
    );
  }
}
