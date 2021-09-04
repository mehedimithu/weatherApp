import 'dart:core';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/forecast/model/forecast_model.dart';
import 'package:weather_app/forecast/model/weather_model.dart';
import 'package:weather_app/forecast/network/network.dart';
import 'package:weather_app/forecast/network/weatherApi.dart';
import 'package:weather_app/models/model.dart';
import 'package:weather_app/services/getWeather.dart';
import 'package:weather_app/utils/convert_icons.dart';
import 'package:weather_app/utils/utils.dart';

import 'forecastCard.dart';

class CurrentWeatherPage extends StatefulWidget {
  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final TextEditingController _mes = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _weatherResponse;

  Future<ForcastModel?>? _forecast;
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
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: FutureBuilder<WeatherData?>(
                      future: _response,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return buildColumn(snapshot);
                        } else {
                          return Center(child: Text("Search the city name"));
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: FutureBuilder<ForcastModel?>(
                      future: _forecast,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              viewWeather(snapshot),
                            ],
                          );
                        } else {
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("data not found!"),
                            ),
                          );
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

  Column buildColumn(AsyncSnapshot<WeatherData?> snapshot) {
    var weatherList = snapshot.data!.dt! * 1000;
    var formatDate = DateTime.fromMillisecondsSinceEpoch(weatherList);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //
        // Image.network(
        //   "${snapshot.data!.iconUrl}",
        //   width: MediaQuery.of(context).size.width/2.5,
        //   height: 140,
        //   fit: BoxFit.fill,
        // ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: getWeatherIcons(
              weatherDescription: snapshot.data!.weather![0].main!,
              color: Colors.grey.shade400,
              size: 100),
        ),

        Text(
          '${snapshot.data!.name!.toUpperCase()}, ${snapshot.data!.sys!.country!.toUpperCase()} ',
          style: TextStyle(fontSize: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${snapshot.data!.main!.temp!.toStringAsFixed(2)} °F',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(width: 10),
            Text("${snapshot.data!.weather![0].description!.toUpperCase()}"),
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
                      "Speed: ${snapshot.data!.wind!.speed!.toStringAsFixed(1)} mi/h"),
                  Icon(FontAwesomeIcons.wind, size: 20, color: Colors.grey),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Humidity: ${snapshot.data!.main!.humidity}%"),
                    Icon(FontAwesomeIcons.solidGrinBeamSweat,
                        size: 20, color: Colors.grey),
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
                        "High:${snapshot.data!.main!.tempMax!.toStringAsFixed(0)}°F"),
                    Icon(FontAwesomeIcons.temperatureHigh,
                        size: 20, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Image buildImage(AsyncSnapshot<WeatherData?> snapshot) {
    return Image.network(
      snapshot.data!.iconUrl,
      height: 100,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.contain,
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

  Widget viewWeather(AsyncSnapshot<ForcastModel?> snapshot) {
    var dataList = snapshot.data!.daily;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "7 Days Forecast of dhaka".toUpperCase(),
          style: TextStyle(fontSize: 14),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: dataList!.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.7,
                height: 160,
                child: forecastCard(snapshot, index),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.red.shade200,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
