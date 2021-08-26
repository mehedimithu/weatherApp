import 'package:flutter/material.dart';
import 'package:weather_app/models/model.dart';
import 'package:weather_app/services/getWeather.dart';

class CurrentWeatherPage extends StatefulWidget {
  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final TextEditingController _wer = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;

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
                controller: _wer,
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
    final response = await _dataService.getCurrentWeather(_wer.text);
    setState(() => _response = response);
  }
}
