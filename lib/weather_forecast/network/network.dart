import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/weather_forecast/model/data.dart';

class Network {
  Future<Data?> getWeatherForecast(String? cityName, int cnt) async {
    final queryParameters = {
      'q': cityName,
      'cnt': cnt,
      'appid': '032dbc88c111154959aaffb1a0103112',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/forecast/daily?', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print("Weather data: ${response.body}");
      final json = jsonDecode(response.body);
      return Data.fromJson(json);
    } else {
      print(response.statusCode.toString());
    }
  }
}
