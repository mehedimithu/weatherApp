import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/forecast/model/weather_model.dart';

class WeatherNewtork {
  Future<WeatherData?> getWeather({required String cityName}) async {
    final queryParameters = {
      'q': cityName,
      'appid': '032dbc88c111154959aaffb1a0103112',
      'units': 'imperial'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print(response.body);
      final json = jsonDecode(response.body);
      return WeatherData.fromJson(json);
    } else {
      print(response.statusCode.toString());
    }
  }
}
