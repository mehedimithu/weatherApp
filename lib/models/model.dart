/*
{
  "weather": [
    {
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 282.55,
  },
  
  "name": "Mountain View",
}                     
 */

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({
    required this.temperature,
  });

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];

    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherResponse {
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;
  final double feelsLike;
  final double low;
  final double high;
  final int humidity;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse(
      {required this.cityName,
      required this.tempInfo,
      required this.weatherInfo,
      required this.feelsLike,
      required this.low,
      required this.high,
      required this.humidity});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final feelsLike = json['main']['feels_like'];
    final low = json['main']['temp_min'];
    final high = json['main']['temp_max'];
    final humidity = json['main']['humidity'];

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(
        cityName: cityName,
        tempInfo: tempInfo,
        weatherInfo: weatherInfo,
        feelsLike: feelsLike,
        low: low,
        high: high,
        humidity: humidity);
  }
}
