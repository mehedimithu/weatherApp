import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:weather_app/forecast/model/forecast_model.dart';
import 'package:weather_app/forecast/model/weather_model.dart';
import 'package:weather_app/forecast/network/network.dart';
import 'package:weather_app/forecast/network/weatherApi.dart';
import 'package:weather_app/models/model.dart';
import 'package:weather_app/services/getWeather.dart';
import 'package:weather_app/utils/utils.dart';

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
  String _city = "dhaka";

  @override
  void initState() {
    super.initState();
    _forecast = Network().getForecast(lat, lon);
    _response = getWeatherData(cityName: _city);
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
                // if (_weatherResponse != null)
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Image.network(_weatherResponse!.iconUrl,
                //         fit: BoxFit.cover),
                //     Text(
                //       '${_weatherResponse!.cityName.toUpperCase()}',
                //       style: TextStyle(fontSize: 40),
                //     ),
                //     Text(
                //       '${_weatherResponse!.tempInfo.temperature}°F',
                //       style: TextStyle(fontSize: 40),
                //     ),
                //     Text(_weatherResponse!.weatherInfo.description),
                //     Text("Feels Like: ${_weatherResponse!.feelsLike}°F"),
                //     Text(
                //         "H: ${_weatherResponse!.high}°F  L: ${_weatherResponse!.low}°F "),
                //     Text("Humidity: ${_weatherResponse!.humidity}%"),
                //   ],
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: FutureBuilder<WeatherData?>(
                      future: _response,
                      builder: (context, snapshat) {
                        if (snapshat.hasData) {
                          return buildColumn(snapshat);
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
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

  Column buildColumn(AsyncSnapshot<WeatherData?> snapshat) {
    var weatherList = snapshat.data!.dt! * 1000;
    var formatDate = DateTime.fromMillisecondsSinceEpoch(weatherList);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(snapshat.data!.iconUrl, fit: BoxFit.cover),
        Text(
          '${snapshat.data!.name!.toUpperCase()}, ${snapshat.data!.sys!.country!.toUpperCase()} ',
          style: TextStyle(fontSize: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${snapshat.data!.main!.temp!.toStringAsFixed(2)} °F',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(width: 10),
            Text("${snapshat.data!.weather![0].description!.toUpperCase()}"),
          ],
        ),
        Text(
          "${Util.getFormattedDate(formatDate)}",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 08),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "${snapshat.data!.wind!.speed!.toStringAsFixed(1)} mi/h"),
                  Icon(Icons.speed, size: 20, color: Colors.brown),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${snapshat.data!.main!.humidity}%"),
                    Icon(Icons.hdr_weak, size: 20, color: Colors.brown),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "High: ${snapshat.data!.main!.tempMax!.toStringAsFixed(0)}°F,  Low: ${snapshat.data!.main!.tempMin!.toStringAsFixed(0)}°F  "),
                    Icon(Icons.whatshot, size: 20, color: Colors.brown),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
            suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {}),
            filled: true,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.all(8),
            hintText: "Enter the city name",
          ),
          onSubmitted: (value) {
            setState(() {
              _city = value;
              getWeatherData(cityName: _city);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherData?>? getWeatherData({required String cityName}) {
    _response = WeatherNewtork().getWeather(cityName: _city);
  }

  Widget viewWeather(AsyncSnapshot<ForecastModel?> snapshot) {
    var dailyList = snapshot.data!.daily;
    var currentList = snapshot.data!.current;
    var formatDate =
        DateTime.fromMillisecondsSinceEpoch(dailyList![0].dt!.toInt());
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text("${Util.getFormattedDate(formatDate)}"),
          // Text("Description: ${currentList!.weather![0].description}"),
          // Text("Humidity: ${currentList.humidity.toString()}°F"),
        ],
      ),
    );
  }
}
