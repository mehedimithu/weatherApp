import 'package:flutter/material.dart';
import 'package:weather_app/forecast/model/forecast_model.dart';
import 'package:weather_app/forecast/model/network/network.dart';
import 'package:weather_app/models/model.dart';
import 'package:weather_app/services/getWeather.dart';

class CurrentWeatherPage extends StatefulWidget {
  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final TextEditingController _mes = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;
  Future<ForecastModel?>? _forecast;

  double lat = 23.7104;
  double lon = 90.4074;

  @override
  void initState() {
    super.initState();
    _forecast = Network().getForecast(lat, lon);
    _forecast!.then((weather) => print(weather!.daily));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_response != null)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(_response!.iconUrl, fit: BoxFit.cover),
                Text(
                  '${_response!.cityName}',
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  '${_response!.tempInfo.temperature}°F',
                  style: TextStyle(fontSize: 40),
                ),
                Text(_response!.weatherInfo.description),
                Text("Feels Like: ${_response!.feelsLike}°F"),
                Text("H: ${_response!.high}°F   L: ${_response!.low}°F "),
                Text("Humidity: ${_response!.humidity}%"),
              ],
            ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: TextField(
                textAlign: TextAlign.start,
                controller: _mes,
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Enter the city name",
                ),
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                shadowColor: Colors.redAccent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                minimumSize: Size(150, 40),
              ),
              onPressed: _search,
              child: Text(
                "Weather",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ],
      )),
    );
  }

  void _search() async {
    final response = await _dataService.getCurrentWeather(_mes.text);
    setState(() => _response = response);
  }
}
