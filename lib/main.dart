import 'package:flutter/material.dart';
import 'package:weather_app/weather_forecast/ui/weather_forecast.dart';

import 'pages/currentWeather.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherForecast(),
    );
  }
}
