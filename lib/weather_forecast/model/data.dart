// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  String? cod;
  int? message;
  int? cnt;
  List<ListElement>? list;
  City? city;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cod: json["cod"],
    message: json["message"].toint(),
    cnt: json["cnt"].toint(),
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    city: City.fromJson(json["city"]),
  );

  Map<String, dynamic> toJson() => {
    "cod": cod,
    "message": message,
    "cnt": cnt,
    "list": List<dynamic>.from(list!.map((x) => x.toJson())),
    "city": city!.toJson(),
  };
}

class City {
  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  int? id;
  String? name;
  Coord? coord;
  String? country;
  int ?population;
  int? timezone;
  int? sunrise;
  int? sunset;

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"].toint(),
    name: json["name"].toString(),
    coord: Coord.fromJson(json["coord"]),
    country: json["country"].toString(),
    population: json["population"].toint(),
    timezone: json["timezone"].toint(),
    sunrise: json["sunrise"].toint(),
    sunset: json["sunset"].toint(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "coord": coord!.toJson(),
    "country": country,
    "population": population,
    "timezone": timezone,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}

class Coord {
  Coord({
    this.lat,
    this.lon,
  });

  double? lat;
  double? lon;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
  };
}

class ListElement {
  ListElement({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt,
  });

  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  int? pop;
  Rain? rain;
  Sys? sys;
  DateTime? dtTxt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    dt: json["dt"].toint(),
    main: Main.fromJson(json["main"]),
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    clouds: Clouds.fromJson(json["clouds"]),
    wind: Wind.fromJson(json["wind"]),
    visibility: json["visibility"].toint(),
    pop: json["pop"].toint(),
    rain: Rain.fromJson(json["rain"]),
    sys: Sys.fromJson(json["sys"]),
    dtTxt: DateTime.parse(json["dt_txt"]),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "main": main!.toJson(),
    "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
    "clouds": clouds!.toJson(),
    "wind": wind!.toJson(),
    "visibility": visibility,
    "pop": pop,
    "rain": rain!.toJson(),
    "sys": sys!.toJson(),
    "dt_txt": dtTxt!.toIso8601String(),
  };
}

class Clouds {
  Clouds({
    this.all,
  });

  int ? all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"].toint(),
  );

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"].toDouble(),
    feelsLike: json["feels_like"].toDouble(),
    tempMin: json["temp_min"].toDouble(),
    tempMax: json["temp_max"].toDouble(),
    pressure: json["pressure"].toint(),
    seaLevel: json["sea_level"].toint(),
    grndLevel: json["grnd_level"].toint(),
    humidity: json["humidity"].toint(),
    tempKf: json["temp_kf"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "feels_like": feelsLike,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "pressure": pressure,
    "sea_level": seaLevel,
    "grnd_level": grndLevel,
    "humidity": humidity,
    "temp_kf": tempKf,
  };
}

class Rain {
  Rain({
    this.the3H,
  });

  double? the3H;

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
    the3H: json["3h"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "3h": the3H,
  };
}

class Sys {
  Sys({
    this.pod,
  });

  String? pod;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    pod: json["pod"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "pod": pod,
  };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int? id;
  String? main;
  String? description;
  String? icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"].toint(),
    main: json["main"].toString(),
    description: json["description"].toString(),
    icon: json["icon"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}

class Wind {
  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  double ?speed;
  int? deg;
  double? gust;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"].toDouble(),
    deg: json["deg"].toint(),
    gust: json["gust"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
    "gust": gust,
  };
}
