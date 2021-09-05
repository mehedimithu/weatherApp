import 'dart:convert';

ForcastModel forcastModelFromJson(String str) => ForcastModel.fromJson(json.decode(str));

String forcastModelToJson(ForcastModel data) => json.encode(data.toJson());


class ForcastModel {
  ForcastModel({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.minutely,
    this.hourly,
    this.daily,
  });

  double? lat;
  double ?lon;
  String ?timezone;
  int? timezoneOffset;
  Current ?current;
  List<Minutely>? minutely;
  List<Current> ?hourly;
  List<Daily>? daily;



  factory ForcastModel.fromJson(Map<String, dynamic> json) => ForcastModel(
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
    timezone: json["timezone"],
    timezoneOffset: json["timezone_offset"],
    current: Current.fromJson(json["current"]),
    minutely: List<Minutely>.from(json["minutely"].map((x) => Minutely.fromJson(x))),
    hourly: List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
    daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
    "timezone": timezone,
    "timezone_offset": timezoneOffset,
    "current": current!.toJson(),
    "minutely": List<dynamic>.from(minutely!.map((x) => x.toJson())),
    "hourly": List<dynamic>.from(hourly!.map((x) => x.toJson())),
    "daily": List<dynamic>.from(daily!.map((x) => x.toJson())),
  };
}

class Current {
  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.weather,
    this.windGust,
    this.pop,
    this.rain,
  });

  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  List<Weather>? weather;
  double? windGust;
  double? pop;
  Rain ?rain;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    dt: json["dt"],
    sunrise: json["sunrise"] == null ? null : json["sunrise"],
    sunset: json["sunset"] == null ? null : json["sunset"],
    temp: json["temp"].toDouble(),
    feelsLike: json["feels_like"].toDouble(),
    pressure: json["pressure"],
    humidity: json["humidity"],
    dewPoint: json["dew_point"].toDouble(),
    uvi: json["uvi"].toDouble(),
    clouds: json["clouds"],
    visibility: json["visibility"],
    windSpeed: json["wind_speed"].toDouble(),
    windDeg: json["wind_deg"],
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    windGust: json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
    pop: json["pop"] == null ? null : json["pop"].toDouble(),
    rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "sunrise": sunrise == null ? null : sunrise,
    "sunset": sunset == null ? null : sunset,
    "temp": temp,
    "feels_like": feelsLike,
    "pressure": pressure,
    "humidity": humidity,
    "dew_point": dewPoint,
    "uvi": uvi,
    "clouds": clouds,
    "visibility": visibility,
    "wind_speed": windSpeed,
    "wind_deg": windDeg,
    "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
    "wind_gust": windGust == null ? null : windGust,
    "pop": pop == null ? null : pop,
    "rain": rain == null ? null : rain!.toJson(),
  };
}

class Rain {
  Rain({
    this.the1H,
  });

  double? the1H;

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
    the1H: json["1h"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "1h": the1H,
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
  Main ?main;
  Description? description;
  String ?icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"],
    main: mainValues.map![json["main"]],
    description: descriptionValues.map![json["description"]],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": mainValues.reverse![main],
    "description": descriptionValues.reverse![description],
    "icon": icon,
  };
}

enum Description { HAZE, LIGHT_RAIN, MODERATE_RAIN, SCATTERED_CLOUDS, FEW_CLOUDS, BROKEN_CLOUDS, OVERCAST_CLOUDS }

final descriptionValues = EnumValues({
  "broken clouds": Description.BROKEN_CLOUDS,
  "few clouds": Description.FEW_CLOUDS,
  "haze": Description.HAZE,
  "light rain": Description.LIGHT_RAIN,
  "moderate rain": Description.MODERATE_RAIN,
  "overcast clouds": Description.OVERCAST_CLOUDS,
  "scattered clouds": Description.SCATTERED_CLOUDS
});

enum Main { HAZE, RAIN, CLOUDS }

final mainValues = EnumValues({
  "Clouds": Main.CLOUDS,
  "Haze": Main.HAZE,
  "Rain": Main.RAIN
});

class Daily {
  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.rain,
    this.uvi,
  });

  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double ?dewPoint;
  double ?windSpeed;
  int ?windDeg;
  double ?windGust;
  List<Weather> ?weather;
  int ?clouds;
  double ?pop;
  double? rain;
  double ?uvi;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
    dt: json["dt"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    moonrise: json["moonrise"],
    moonset: json["moonset"],
    moonPhase: json["moon_phase"].toDouble(),
    temp: Temp.fromJson(json["temp"]),
    feelsLike: FeelsLike.fromJson(json["feels_like"]),
    pressure: json["pressure"],
    humidity: json["humidity"],
    dewPoint: json["dew_point"].toDouble(),
    windSpeed: json["wind_speed"].toDouble(),
    windDeg: json["wind_deg"],
    windGust: json["wind_gust"].toDouble(),
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    clouds: json["clouds"],
    pop: json["pop"].toDouble(),
    rain: json["rain"],
    uvi: json["uvi"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "sunrise": sunrise,
    "sunset": sunset,
    "moonrise": moonrise,
    "moonset": moonset,
    "moon_phase": moonPhase,
    "temp": temp!.toJson(),
    "feels_like": feelsLike!.toJson(),
    "pressure": pressure,
    "humidity": humidity,
    "dew_point": dewPoint,
    "wind_speed": windSpeed,
    "wind_deg": windDeg,
    "wind_gust": windGust,
    "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
    "clouds": clouds,
    "pop": pop,
    "rain": rain,
    "uvi": uvi,
  };
}

class FeelsLike {
  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  double? day;
  double? night;
  double? eve;
  double? morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
    day: json["day"].toDouble(),
    night: json["night"].toDouble(),
    eve: json["eve"].toDouble(),
    morn: json["morn"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "night": night,
    "eve": eve,
    "morn": morn,
  };
}

class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
    day: json["day"].toDouble(),
    min: json["min"].toDouble(),
    max: json["max"].toDouble(),
    night: json["night"].toDouble(),
    eve: json["eve"].toDouble(),
    morn: json["morn"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "min": min,
    "max": max,
    "night": night,
    "eve": eve,
    "morn": morn,
  };
}

class Minutely {
  Minutely({
    this.dt,
    this.precipitation,
  });

  int? dt;
  int? precipitation;

  factory Minutely.fromJson(Map<String, dynamic> json) => Minutely(
    dt: json["dt"],
    precipitation: json["precipitation"],
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "precipitation": precipitation,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
