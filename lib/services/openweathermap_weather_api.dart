import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/locations.dart';
import 'package:weather_app/services/weatherApi.dart';

class OpenweathermapWeatherApi   extends WeatherApi{
  static const appId = "032dbc88c111154959aaffb1a0103112";
  http.Client? httpClient;

  OpenWeatherMapWeatherApi() {
    this.httpClient = http.Client();
  }

  Future<Location> getLocation(String cityName) async {
    final queryParameters = {
      'q': cityName,
      'appid': '032dbc88c111154959aaffb1a0103112',
      'units': 'imperial'
    };

    final requestUrl = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await this.httpClient?.get(requestUrl);
    print(response?.body);

    if (response?.statusCode != 200) {

      throw Exception(
          'Error retrieving location for city $cityName: ${response?.statusCode}');
    }
    return Location.fromJson(jsonDecode(response!.body));
  }

  @override
  Future<Forecast> getWeather(Location location) async {
    final queryParameters = {
      'lat': '${location.latitude}',
      'lon': '${location.longitude}',
      'exclude': 'hourly',
      'appid': '032dbc88c111154959aaffb1a0103112',
      'units': 'imperial'
    };

    final uri = Uri.https(
        'api.openweathermap.org', 'data/2.5/onecall', queryParameters);
    final response = await this.httpClient?.get(uri);
    print(response?.body);
    if (response?.statusCode != 200) {
      throw Exception('Error retrieving weather: ${response?.statusCode}');
    }
    return Forecast.fromJson(jsonDecode(response!.body));
  }
}
