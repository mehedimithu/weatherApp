import 'dart:convert';

import 'package:weather_app/forecast/model/forecast_model.dart';

import 'package:http/http.dart' as http;

class Network {
  Future<ForecastModel?>? getForecast(double lat, double lon) async {
    final queryParameters = {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'exclude': 'hourly',
      'appid': '032dbc88c111154959aaffb1a0103112',
      'units': 'imperial'
    };

    final uri = Uri.https(
        'api.openweathermap.org', 'data/2.5/onecall', queryParameters);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print(response.body);
      return ForecastModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error code: ${response.statusCode}");
    }
  }
}
