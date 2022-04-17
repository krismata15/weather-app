/// cod : '200'
/// message : 0
/// cnt : 5
/// list : [{'dt':1623790800,'main':{'temp':27.05,'feels_like':28,'temp_min':24.6,'temp_max':27.05,'pressure':1014,'sea_level':1014,'grnd_level':918,'humidity':58,'temp_kf':2.45},'weather':[{'id':500,'main':'Rain','description':'lluvia ligera','icon':'10d'}],'clouds':{'all':92},'wind':{'speed':2.22,'deg':67,'gust':3.81},'visibility':10000,'pop':0.32,'rain':{'3h':0.33},'sys':{'pod':'d'},'dt_txt':'2021-06-15 21:00:00'},{'dt':1623801600,'main':{'temp':24.57,'feels_like':24.91,'temp_min':19.6,'temp_max':24.57,'pressure':1015,'sea_level':1015,'grnd_level':919,'humidity':70,'temp_kf':4.97},'weather':[{'id':803,'main':'Clouds','description':'muy nuboso','icon':'04n'}],'clouds':{'all':82},'wind':{'speed':0.84,'deg':107,'gust':2.09},'visibility':10000,'pop':0.14,'sys':{'pod':'n'},'dt_txt':'2021-06-16 00:00:00'},{'dt':1623812400,'main':{'temp':21.72,'feels_like':22.09,'temp_min':19.06,'temp_max':21.72,'pressure':1017,'sea_level':1017,'grnd_level':921,'humidity':82,'temp_kf':2.66},'weather':[{'id':802,'main':'Clouds','description':'nubes dispersas','icon':'03n'}],'clouds':{'all':41},'wind':{'speed':1.29,'deg':126,'gust':2.43},'visibility':10000,'pop':0.15,'sys':{'pod':'n'},'dt_txt':'2021-06-16 03:00:00'},{'dt':1623823200,'main':{'temp':18.63,'feels_like':19.06,'temp_min':18.63,'temp_max':18.63,'pressure':1016,'sea_level':1016,'grnd_level':918,'humidity':96,'temp_kf':0},'weather':[{'id':801,'main':'Clouds','description':'algo de nubes','icon':'02n'}],'clouds':{'all':16},'wind':{'speed':1.24,'deg':153,'gust':1.59},'visibility':10000,'pop':0.14,'sys':{'pod':'n'},'dt_txt':'2021-06-16 06:00:00'},{'dt':1623834000,'main':{'temp':18.07,'feels_like':18.41,'temp_min':18.07,'temp_max':18.07,'pressure':1016,'sea_level':1016,'grnd_level':918,'humidity':95,'temp_kf':0},'weather':[{'id':801,'main':'Clouds','description':'algo de nubes','icon':'02n'}],'clouds':{'all':14},'wind':{'speed':1.37,'deg':164,'gust':1.59},'visibility':10000,'pop':0.08,'sys':{'pod':'n'},'dt_txt':'2021-06-16 09:00:00'}]
/// city : {'id':3646738,'name':'Caracas','coord':{'lat':10.488,'lon':-66.8792},'country':'VE','population':0,'timezone':-14400,'sunrise':1623751566,'sunset':1623797407}

class ForecastWeather {
  String? cod;
  int? message;
  int? cnt;
  List<ForecastData>? forecastList;
  City? city;

  ForecastWeather(
      {this.cod, this.message, this.cnt, this.forecastList, this.city});

  ForecastWeather.fromJson(dynamic json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      forecastList = [];
      json['list'].forEach((v) {
        forecastList!.add(ForecastData.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['cod'] = cod;
    map['message'] = message;
    map['cnt'] = cnt;
    if (forecastList != null) {
      map['list'] = forecastList!.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      map['city'] = city!.toJson();
    }
    return map;
  }
}

/// id : 3646738
/// name : 'Caracas'
/// coord : {'lat':10.488,'lon':-66.8792}
/// country : 'VE'
/// population : 0
/// timezone : -14400
/// sunrise : 1623751566
/// sunset : 1623797407

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  City(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset});

  City.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (coord != null) {
      map['coord'] = coord!.toJson();
    }
    map['country'] = country;
    map['population'] = population;
    map['timezone'] = timezone;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }
}

/// lat : 10.488
/// lon : -66.8792

class Coord {
  double? lat;
  double? lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(dynamic json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    return map;
  }
}

/// dt : 1623790800
/// main : {'temp':27.05,'feels_like':28,'temp_min':24.6,'temp_max':27.05,'pressure':1014,'sea_level':1014,'grnd_level':918,'humidity':58,'temp_kf':2.45}
/// weather : [{'id':500,'main':'Rain','description':'lluvia ligera','icon':'10d'}]
/// clouds : {'all':92}
/// wind : {'speed':2.22,'deg':67,'gust':3.81}
/// visibility : 10000
/// pop : 0.32
/// rain : {'3h':0.33}
/// sys : {'pod':'d'}
/// dt_txt : '2021-06-15 21:00:00'

class ForecastData {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop;
  Sys? sys;
  String? dtTxt;

  ForecastData(
      {this.dt,
      this.main,
      this.weather,
      this.clouds,
      this.wind,
      this.visibility,
      this.pop,
      this.sys,
      this.dtTxt});

  ForecastData.fromJson(dynamic json) {
    dt = json['dt'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['dt'] = dt;
    if (main != null) {
      map['main'] = main!.toJson();
    }
    if (weather != null) {
      map['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (clouds != null) {
      map['clouds'] = clouds!.toJson();
    }
    if (wind != null) {
      map['wind'] = wind!.toJson();
    }
    map['visibility'] = visibility;
    map['pop'] = pop;
    if (sys != null) {
      map['sys'] = sys!.toJson();
    }
    map['dt_txt'] = dtTxt;
    return map;
  }
}

/// pod : 'd'

class Sys {
  String? pod;

  Sys({this.pod});

  Sys.fromJson(dynamic json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['pod'] = pod;
    return map;
  }
}

/// speed : 2.22
/// deg : 67
/// gust : 3.81

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(dynamic json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    map['gust'] = gust;
    return map;
  }
}

/// all : 92

class Clouds {
  int? all;

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

/// id : 500
/// main : 'Rain'
/// description : 'lluvia ligera'
/// icon : '10d'

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

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

/// temp : 27.05
/// feels_like : 28
/// temp_min : 24.6
/// temp_max : 27.05
/// pressure : 1014
/// sea_level : 1014
/// grnd_level : 918
/// humidity : 58
/// temp_kf : 2.45

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.seaLevel,
      this.grndLevel,
      this.humidity,
      this.tempKf});

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    feelsLike = (json['feels_like'] as num).toDouble();
    tempMin = (json['temp_min'] as num).toDouble();
    tempMax = (json['temp_max'] as num).toDouble();
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = (json['temp_kf'] as num).toDouble();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['sea_level'] = seaLevel;
    map['grnd_level'] = grndLevel;
    map['humidity'] = humidity;
    map['temp_kf'] = tempKf;
    return map;
  }
}
