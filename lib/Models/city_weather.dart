/// coord : {'lon':-66.8792,'lat':10.488}
/// weather : [{'id':802,'main':'Clouds','description':'nubes dispersas','icon':'03d'}]
/// base : 'stations'
/// main : {'temp':27.94,'feels_like':29.15,'temp_min':24.67,'temp_max':28.43,'pressure':1016,'humidity':58}
/// visibility : 10000
/// wind : {'speed':1.34,'deg':225,'gust':4.02}
/// clouds : {'all':40}
/// dt : 1623781197
/// sys : {'type':2,'id':2004667,'country':'VE','sunrise':1623751566,'sunset':1623797407}
/// timezone : -14400
/// id : 3646738
/// name : 'Caracas'
/// cod : 200

class CityWeatherList {
  List<CityWeather> citiesWeather;

  CityWeatherList({this.citiesWeather = const <CityWeather>[]});

  CityWeatherList.fromJson(dynamic json) {
    if (json['list'] != null) {
      citiesWeather = [];
      json['list'].forEach((v) {
        citiesWeather.add(CityWeather.fromJson(v));
      });
    }
  }
}

class CityWeather {
  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  //Wind wind;
  //Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  CityWeather(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  CityWeather.fromJson(dynamic json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    dt = json['dt'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (coord != null) {
      map['coord'] = coord.toJson();
    }
    if (weather != null) {
      map['weather'] = weather.map((v) => v.toJson()).toList();
    }
    map['base'] = base;
    if (main != null) {
      map['main'] = main.toJson();
    }
    map['visibility'] = visibility;
    map['dt'] = dt;
    if (sys != null) {
      map['sys'] = sys.toJson();
    }
    map['timezone'] = timezone;
    map['id'] = id;
    map['name'] = name;
    map['cod'] = cod;
    return map;
  }
}

/// type : 2
/// id : 2004667
/// country : 'VE'
/// sunrise : 1623751566
/// sunset : 1623797407

class Sys {
  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  Sys.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    map['country'] = country;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }
}

/// all : 40

class Clouds {
  int all;

  Clouds({this.all});

  Clouds.fromJson(dynamic json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['all'] = all;
    return map;
  }
}

/// speed : 1.34
/// deg : 225
/// gust : 4.02

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(dynamic json) {
    speed = (json['speed'] as num).toDouble();
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    map['gust'] = gust;
    return map;
  }
}

/// temp : 27.94
/// feels_like : 29.15
/// temp_min : 24.67
/// temp_max : 28.43
/// pressure : 1016
/// humidity : 58

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  Main.fromJson(dynamic json) {
    temp = (json['temp'] as num).toDouble();
    feelsLike = (json['feels_like'] as num).toDouble();
    tempMin = (json['temp_min'] as num).toDouble();
    tempMax = (json['temp_max'] as num).toDouble();
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    return map;
  }
}

/// id : 802
/// main : 'Clouds'
/// description : 'nubes dispersas'
/// icon : '03d'

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }
}

/// lon : -66.8792
/// lat : 10.488

class Coord {
  double lon;
  double lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(dynamic json) {
    lon = (json['lon'] as num).toDouble();
    lat = (json['lat'] as num).toDouble();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }
}
