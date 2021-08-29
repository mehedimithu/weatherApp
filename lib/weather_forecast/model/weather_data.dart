/// cod : "200"
/// message : 0
/// cnt : 1
/// list : [{"dt":1630238400,"main":{"temp":86.85,"feels_like":98.17,"temp_min":84.97,"temp_max":86.85,"pressure":1003,"sea_level":1003,"grnd_level":1001,"humidity":72,"temp_kf":1.04},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":77},"wind":{"speed":11.97,"deg":160,"gust":17.87},"visibility":10000,"pop":1,"rain":{"3h":0.94},"sys":{"pod":"d"},"dt_txt":"2021-08-29 12:00:00"}]
/// city : {"id":1185241,"name":"Dhaka","coord":{"lat":23.7104,"lon":90.4074},"country":"BD","population":10356500,"timezone":21600,"sunrise":1630193956,"sunset":1630239594}

class WeatherData {
  String? _cod;
  int? _message;
  int? _cnt;
  List<ListType>? _list;
  City? _city;

  String? get cod => _cod;
  int? get message => _message;
  int? get cnt => _cnt;
  List<ListType>? get list => _list;
  City? get city => _city;

  WeatherData({
      String? cod, 
      int? message, 
      int? cnt, 
      List<ListType>? list,
      City? city}){
    _cod = cod;
    _message = message;
    _cnt = cnt;
    _list = list;
    _city = city;
}

  WeatherData.fromJson(dynamic json) {
    _cod = json['cod'];
    _message = json['message'];
    _cnt = json['cnt'];
    if (json['list'] != null) {
      _list = [];
      json['list'].forEach((v) {
        _list?.add(ListType.fromJson(v));
      });
    }
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['cod'] = _cod;
    map['message'] = _message;
    map['cnt'] = _cnt;
    if (_list != null) {
      map['list'] = _list?.map((v) => v.toJson()).toList();
    }
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    return map;
  }

}

/// id : 1185241
/// name : "Dhaka"
/// coord : {"lat":23.7104,"lon":90.4074}
/// country : "BD"
/// population : 10356500
/// timezone : 21600
/// sunrise : 1630193956
/// sunset : 1630239594

class City {
  int? _id;
  String? _name;
  Coord? _coord;
  String? _country;
  int? _population;
  int? _timezone;
  int? _sunrise;
  int? _sunset;

  int? get id => _id;
  String? get name => _name;
  Coord? get coord => _coord;
  String? get country => _country;
  int? get population => _population;
  int? get timezone => _timezone;
  int? get sunrise => _sunrise;
  int? get sunset => _sunset;

  City({
      int? id, 
      String? name, 
      Coord? coord, 
      String? country, 
      int? population, 
      int? timezone, 
      int? sunrise, 
      int? sunset}){
    _id = id;
    _name = name;
    _coord = coord;
    _country = country;
    _population = population;
    _timezone = timezone;
    _sunrise = sunrise;
    _sunset = sunset;
}

  City.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    _country = json['country'];
    _population = json['population'];
    _timezone = json['timezone'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_coord != null) {
      map['coord'] = _coord?.toJson();
    }
    map['country'] = _country;
    map['population'] = _population;
    map['timezone'] = _timezone;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    return map;
  }

}

/// lat : 23.7104
/// lon : 90.4074

class Coord {
  double? _lat;
  double? _lon;

  double? get lat => _lat;
  double? get lon => _lon;

  Coord({
      double? lat, 
      double? lon}){
    _lat = lat;
    _lon = lon;
}

  Coord.fromJson(dynamic json) {
    _lat = json['lat'];
    _lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lon'] = _lon;
    return map;
  }

}

/// dt : 1630238400
/// main : {"temp":86.85,"feels_like":98.17,"temp_min":84.97,"temp_max":86.85,"pressure":1003,"sea_level":1003,"grnd_level":1001,"humidity":72,"temp_kf":1.04}
/// weather : [{"id":500,"main":"Rain","description":"light rain","icon":"10d"}]
/// clouds : {"all":77}
/// wind : {"speed":11.97,"deg":160,"gust":17.87}
/// visibility : 10000
/// pop : 1
/// rain : {"3h":0.94}
/// sys : {"pod":"d"}
/// dt_txt : "2021-08-29 12:00:00"

class ListType {
  int? _dt;
  Main? _main;
  List<Weather>? _weather;
  Clouds? _clouds;
  Wind? _wind;
  int? _visibility;
  int? _pop;
  Rain? _rain;
  Sys? _sys;
  String? _dtTxt;

  int? get dt => _dt;
  Main? get main => _main;
  List<Weather>? get weather => _weather;
  Clouds? get clouds => _clouds;
  Wind? get wind => _wind;
  int? get visibility => _visibility;
  int? get pop => _pop;
  Rain? get rain => _rain;
  Sys? get sys => _sys;
  String? get dtTxt => _dtTxt;

  ListType({
      int? dt, 
      Main? main, 
      List<Weather>? weather,
      Clouds? clouds, 
      Wind? wind, 
      int? visibility, 
      int? pop, 
      Rain? rain, 
      Sys? sys, 
      String? dtTxt}){
    _dt = dt;
    _main = main;
    _weather = weather;
    _clouds = clouds;
    _wind = wind;
    _visibility = visibility;
    _pop = pop;
    _rain = rain;
    _sys = sys;
    _dtTxt = dtTxt;
}

  ListType.fromJson(dynamic json) {
    _dt = json['dt'];
    _main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    _wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    _visibility = json['visibility'];
    _pop = json['pop'];
    _rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
    _sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    _dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['dt'] = _dt;
    if (_main != null) {
      map['main'] = _main?.toJson();
    }
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    if (_clouds != null) {
      map['clouds'] = _clouds?.toJson();
    }
    if (_wind != null) {
      map['wind'] = _wind?.toJson();
    }
    map['visibility'] = _visibility;
    map['pop'] = _pop;
    if (_rain != null) {
      map['rain'] = _rain?.toJson();
    }
    if (_sys != null) {
      map['sys'] = _sys?.toJson();
    }
    map['dt_txt'] = _dtTxt;
    return map;
  }

}

/// pod : "d"

class Sys {
  String? _pod;

  String? get pod => _pod;

  Sys({
      String? pod}){
    _pod = pod;
}

  Sys.fromJson(dynamic json) {
    _pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['pod'] = _pod;
    return map;
  }

}

/// 3h : 0.94

class Rain {
  double? _3h;

  double? get h => _3h;

  Rain({
      double? h}){
    _3h = h;
}

  Rain.fromJson(dynamic json) {
    _3h = json['h'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['h'] = _3h;
    return map;
  }

}

/// speed : 11.97
/// deg : 160
/// gust : 17.87

class Wind {
  double? _speed;
  int? _deg;
  double? _gust;

  double? get speed => _speed;
  int? get deg => _deg;
  double? get gust => _gust;

  Wind({
      double? speed, 
      int? deg, 
      double? gust}){
    _speed = speed;
    _deg = deg;
    _gust = gust;
}

  Wind.fromJson(dynamic json) {
    _speed = json['speed'];
    _deg = json['deg'];
    _gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['speed'] = _speed;
    map['deg'] = _deg;
    map['gust'] = _gust;
    return map;
  }

}

/// all : 77

class Clouds {
  int? _all;

  int? get all => _all;

  Clouds({
      int? all}){
    _all = all;
}

  Clouds.fromJson(dynamic json) {
    _all = json['all'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['all'] = _all;
    return map;
  }

}

/// id : 500
/// main : "Rain"
/// description : "light rain"
/// icon : "10d"

class Weather {
  int? _id;
  String? _main;
  String? _description;
  String? _icon;

  int? get id => _id;
  String? get main => _main;
  String? get description => _description;
  String? get icon => _icon;

  Weather({
      int? id, 
      String? main, 
      String? description, 
      String? icon}){
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
}

  Weather.fromJson(dynamic json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }

}

/// temp : 86.85
/// feels_like : 98.17
/// temp_min : 84.97
/// temp_max : 86.85
/// pressure : 1003
/// sea_level : 1003
/// grnd_level : 1001
/// humidity : 72
/// temp_kf : 1.04

class Main {
  double? _temp;
  double? _feelsLike;
  double? _tempMin;
  double? _tempMax;
  int? _pressure;
  int? _seaLevel;
  int? _grndLevel;
  int? _humidity;
  double? _tempKf;

  double? get temp => _temp;
  double? get feelsLike => _feelsLike;
  double? get tempMin => _tempMin;
  double? get tempMax => _tempMax;
  int? get pressure => _pressure;
  int? get seaLevel => _seaLevel;
  int? get grndLevel => _grndLevel;
  int? get humidity => _humidity;
  double? get tempKf => _tempKf;

  Main({
      double? temp, 
      double? feelsLike, 
      double? tempMin, 
      double? tempMax, 
      int? pressure, 
      int? seaLevel, 
      int? grndLevel, 
      int? humidity, 
      double? tempKf}){
    _temp = temp;
    _feelsLike = feelsLike;
    _tempMin = tempMin;
    _tempMax = tempMax;
    _pressure = pressure;
    _seaLevel = seaLevel;
    _grndLevel = grndLevel;
    _humidity = humidity;
    _tempKf = tempKf;
}

  Main.fromJson(dynamic json) {
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
    _pressure = json['pressure'];
    _seaLevel = json['sea_level'];
    _grndLevel = json['grnd_level'];
    _humidity = json['humidity'];
    _tempKf = json['temp_kf'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['temp'] = _temp;
    map['feels_like'] = _feelsLike;
    map['temp_min'] = _tempMin;
    map['temp_max'] = _tempMax;
    map['pressure'] = _pressure;
    map['sea_level'] = _seaLevel;
    map['grnd_level'] = _grndLevel;
    map['humidity'] = _humidity;
    map['temp_kf'] = _tempKf;
    return map;
  }

}