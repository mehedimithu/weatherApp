import 'package:flutter/material.dart';
import 'package:weather_app/forecast/model/forecast_model.dart';
import 'package:weather_app/forecast/model/weather_model.dart';
import 'package:weather_app/forecast/network/network.dart';
import 'package:weather_app/forecast/network/weatherApi.dart';
import 'package:weather_app/models/model.dart';
import 'package:weather_app/services/getWeather.dart';

class CurrentWeatherPage extends StatefulWidget {
  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final TextEditingController _mes = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _weatherResponse;

  Future<ForecastModel?>? _forecast;
  Future<WeatherData?>? _response;

  double lat = 23.7104;
  double lon = 90.4074;

  @override
  void initState() {
    super.initState();
    _forecast = Network().getForecast(lat, lon);
    _response = WeatherNewtork().getWeather(city: "dhaka");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                searchBar(_mes),
                SizedBox(height: 10),
                if (_weatherResponse != null)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(_weatherResponse!.iconUrl,
                          fit: BoxFit.cover),
                      Text(
                        '${_weatherResponse!.cityName.toUpperCase()}',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(
                        '${_weatherResponse!.tempInfo.temperature}°F',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(_weatherResponse!.weatherInfo.description),
                      Text("Feels Like: ${_weatherResponse!.feelsLike}°F"),
                      Text(
                          "H: ${_weatherResponse!.high}°F  L: ${_weatherResponse!.low}°F "),
                      Text("Humidity: ${_weatherResponse!.humidity}%"),
                    ],
                  ),
                Container(
                  child: FutureBuilder<WeatherData?>(
                    future: _response,
                    builder: (context, snapshat) {
                      if (snapshat.hasData) {
                        return Column(
                          children: [
                            Image.network(snapshat.data!.iconUrl,
                                fit: BoxFit.cover),
                            Text(
                              '${snapshat.data!.name!.toUpperCase()}, ${snapshat.data!.sys!.country!.toUpperCase()} ',
                              style: TextStyle(fontSize: 40),
                            ),
                            Text(
                              '${snapshat.data!.tempInfo!.temperature}°F',
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                Container(
                  child: FutureBuilder<ForecastModel?>(
                      future: _forecast,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              viewWeather(snapshot),
                            ],
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  void _search() async {
    final response = await _dataService.getCurrentWeather(_mes.text);
    setState(() => _weatherResponse = response);
  }

  Widget searchBar(_mes) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextField(
          textAlign: TextAlign.start,
          controller: _mes,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: _search,
            ),
            filled: true,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.all(8),
            hintText: "Enter the city name",
          ),
          onSubmitted: (value) {},
        ),
      ),
    );
  }

  Widget viewWeather(AsyncSnapshot<ForecastModel?> snapshot) {
    var dailyList = snapshot.data!.daily;
    var currentList = snapshot.data!.current;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Description: ${currentList!.weather![0].description}"),
          Text("Humidity: ${currentList.humidity.toString()}°F"),
        ],
      ),
    );
  }
}
