import 'package:flutter/material.dart';
import 'package:weather_app/weather_forecast/model/data.dart';
import 'package:weather_app/weather_forecast/network/network.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  //     final data = dataFromJson(jsonString);

  Future<Data?>? forecastData;
  String? _cityName = 'Dhaka';

  @override
  void initState() {
    super.initState();
    setState(() {
      forecastData = Network().getWeatherForecast(_cityName, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
