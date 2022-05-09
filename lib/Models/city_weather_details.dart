import 'package:equatable/equatable.dart';

/// lat : 10.488
/// lon : -66.8792
/// timezone : 'America/Caracas'
/// timezone_offset : -14400
/// current : {'dt':1623781615,'sunrise':1623751566,'sunset':1623797407,'temp':27.94,'feels_like':29.05,'pressure':1016,'humidity':57,'dew_point':18.64,'uvi':9.79,'clouds':40,'visibility':10000,'wind_speed':1.34,'wind_deg':225,'wind_gust':4.02,'weather':[{'id':802,'main':'Clouds','description':'nubes dispersas','icon':'03d'}]}
/// daily : [{'dt':1623772800,'sunrise':1623751566,'sunset':1623797407,'moonrise':1623767160,'moonset':1623813420,'moon_phase':0.17,'temp':{'day':27.3,'min':18.94,'max':27.94,'night':19.23,'eve':23.6,'morn':18.94},'feels_like':{'day':28.39,'night':19.72,'eve':24.08,'morn':19.42},'pressure':1016,'humidity':59,'dew_point':18.59,'wind_speed':2,'wind_deg':113,'wind_gust':4.67,'weather':[{'id':500,'main':'Rain','description':'lluvia ligera','icon':'10d'}],'clouds':61,'pop':0.43,'rain':0.48,'uvi':11.68},{'dt':1623859200,'sunrise':1623837976,'sunset':1623883821,'moonrise':1623856740,'moonset':0,'moon_phase':0.2,'temp':{'day':26.54,'min':18.18,'max':26.54,'night':19.65,'eve':21.69,'morn':18.18},'feels_like':{'day':26.54,'night':20.2,'eve':22.34,'morn':18.56},'pressure':1015,'humidity':61,'dew_point':17.87,'wind_speed':1.44,'wind_deg':161,'wind_gust':3.9,'weather':[{'id':500,'main':'Rain','description':'lluvia ligera','icon':'10d'}],'clouds':23,'pop':0.94,'rain':6.32,'uvi':12.58},{'dt':1623945600,'sunrise':1623924387,'sunset':1623970235,'moonrise':1623946200,'moonset':1623902460,'moon_phase':0.25,'temp':{'day':25.55,'min':18.81,'max':26.04,'night':19.01,'eve':20.66,'morn':19.35},'feels_like':{'day':25.91,'night':19.5,'eve':21.29,'morn':19.87},'pressure':1016,'humidity':67,'dew_point':18.35,'wind_speed':2.29,'wind_deg':172,'wind_gust':3.28,'weather':[{'id':501,'main':'Rain','description':'lluvia moderada','icon':'10d'}],'clouds':100,'pop':1,'rain':18.74,'uvi':11.89},{'dt':1624032000,'sunrise':1624010798,'sunset':1624056648,'moonrise':1624035720,'moonset':1623991440,'moon_phase':0.27,'temp':{'day':24.33,'min':18.48,'max':24.33,'night':18.84,'eve':23.84,'morn':18.48},'feels_like':{'day':24.59,'night':19.29,'eve':24.24,'morn':18.86},'pressure':1018,'humidity':68,'dew_point':17.4,'wind_speed':2.36,'wind_deg':168,'wind_gust':4.06,'weather':[{'id':500,'main':'Rain','description':'lluvia ligera','icon':'10d'}],'clouds':88,'pop':0.54,'rain':2.3,'uvi':10.36},{'dt':1624118400,'sunrise':1624097209,'sunset':1624143061,'moonrise':1624125300,'moonset':1624080420,'moon_phase':0.3,'temp':{'day':26.21,'min':18.56,'max':27.76,'night':19.41,'eve':25.18,'morn':18.56},'feels_like':{'day':26.21,'night':19.78,'eve':25.48,'morn':18.98},'pressure':1017,'humidity':56,'dew_point':16.15,'wind_speed':1.94,'wind_deg':144,'wind_gust':4.09,'weather':[{'id':500,'main':'Rain','description':'lluvia ligera','icon':'10d'}],'clouds':33,'pop':0.2,'rain':0.27,'uvi':13.05},{'dt':1624204800,'sunrise':1624183621,'sunset':1624229474,'moonrise':1624215000,'moonset':1624169460,'moon_phase':0.34,'temp':{'day':26.35,'min':18.98,'max':27.55,'night':19.37,'eve':24.59,'morn':18.98},'feels_like':{'day':26.35,'night':19.79,'eve':24.96,'morn':19.36},'pressure':1017,'humidity':58,'dew_point':16.89,'wind_speed':2.64,'wind_deg':135,'wind_gust':5.79,'weather':[{'id':500,'main':'Rain','description':'lluvia ligera','icon':'10d'}],'clouds':55,'pop':0.34,'rain':1.59,'uvi':1.7},{'dt':1624291200,'sunrise':1624270033,'sunset':1624315886,'moonrise':1624304940,'moonset':1624258680,'moon_phase':0.38,'temp':{'day':25.83,'min':18.65,'max':26.03,'night':19.31,'eve':24.2,'morn':18.7},'feels_like':{'day':26.04,'night':19.8,'eve':24.61,'morn':19.08},'pressure':1017,'humidity':60,'dew_point':17.09,'wind_speed':1.77,'wind_deg':138,'wind_gust':4.52,'weather':[{'id':500,'main':'Rain','description':'lluvia ligera','icon':'10d'}],'clouds':53,'pop':0.7,'rain':2.8,'uvi':2},{'dt':1624377600,'sunrise':1624356445,'sunset':1624402298,'moonrise':1624395060,'moonset':1624348200,'moon_phase':0.42,'temp':{'day':25.27,'min':18.25,'max':25.27,'night':18.92,'eve':22.01,'morn':18.25},'feels_like':{'day':25.63,'night':19.37,'eve':22.67,'morn':18.61},'pressure':1017,'humidity':68,'dew_point':18.47,'wind_speed':1.82,'wind_deg':176,'wind_gust':2.37,'weather':[{'id':500,'main':'Rain','description':'lluvia ligera','icon':'10d'}],'clouds':86,'pop':0.82,'rain':6.5,'uvi':2}]

class CityWeatherDetails extends Equatable {
  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Daily>? daily;

  CityWeatherDetails(
      {this.lat,
      this.lon,
      this.timezone,
      this.timezoneOffset,
      this.current,
      this.daily});

  CityWeatherDetails.fromJson(dynamic json) {
    lat = (json['lat'] as num).toDouble();
    lon = (json['lon'] as num).toDouble();
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    if (json['daily'] != null) {
      daily = [];
      json['daily'].forEach((v) {
        daily!.add(Daily.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    map['timezone'] = timezone;
    map['timezone_offset'] = timezoneOffset;
    if (current != null) {
      map['current'] = current!.toJson();
    }
    if (daily != null) {
      map['daily'] = daily!.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  List<Object?> get props => [lat, lon, timezone, timezoneOffset];
}

/// dt : 1623772800
/// sunrise : 1623751566
/// sunset : 1623797407
/// moonrise : 1623767160
/// moonset : 1623813420
/// moon_phase : 0.17
/// temp : {'day':27.3,'min':18.94,'max':27.94,'night':19.23,'eve':23.6,'morn':18.94}
/// feels_like : {'day':28.39,'night':19.72,'eve':24.08,'morn':19.42}
/// pressure : 1016
/// humidity : 59
/// dew_point : 18.59
/// wind_speed : 2
/// wind_deg : 113
/// wind_gust : 4.67
/// weather : [{'id':500,'main':'Rain','description':'lluvia ligera','icon':'10d'}]
/// clouds : 61
/// pop : 0.43
/// rain : 0.48
/// uvi : 11.68

class Daily {
  int? dt;
  /*int sunrise;
  int sunset;
  int moonrise;
  int moonset;
  double moonPhase;*/
  Temp? temp;
  FeelsLike? feelsLike;
  /*double pressure;
  double humidity;
  double dewPoint;
  double windSpeed;
  double windDeg;
  double windGust;*/
  List<Weather>? weather;
  /*int clouds;
  double pop;
  double rain;
  double uvi;*/

  Daily({this.dt, this.temp, this.feelsLike, this.weather});

  Daily.fromJson(dynamic json) {
    dt = json['dt'];
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    feelsLike = json['feels_like'] != null
        ? FeelsLike.fromJson(json['feels_like'])
        : null;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['dt'] = dt;
    if (temp != null) {
      map['temp'] = temp!.toJson();
    }
    if (feelsLike != null) {
      map['feels_like'] = feelsLike!.toJson();
    }
    if (weather != null) {
      map['weather'] = weather!.map((v) => v.toJson()).toList();
    }
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

/// day : 28.39
/// night : 19.72
/// eve : 24.08
/// morn : 19.42

class FeelsLike {
  double? day;
  double? night;
  double? eve;
  double? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  FeelsLike.fromJson(dynamic json) {
    day = (json['day'] as num).toDouble();
    night = (json['night'] as num).toDouble();
    eve = (json['eve'] as num).toDouble();
    morn = (json['morn'] as num).toDouble();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['day'] = day;
    map['night'] = night;
    map['eve'] = eve;
    map['morn'] = morn;
    return map;
  }
}

/// day : 27.3
/// min : 18.94
/// max : 27.94
/// night : 19.23
/// eve : 23.6
/// morn : 18.94

class Temp {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(dynamic json) {
    day = (json['day'] as num).toDouble();
    min = (json['min'] as num).toDouble();
    max = (json['max'] as num).toDouble();
    night = (json['night'] as num).toDouble();
    eve = (json['eve'] as num).toDouble();
    morn = (json['morn'] as num).toDouble();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['day'] = day;
    map['min'] = min;
    map['max'] = max;
    map['night'] = night;
    map['eve'] = eve;
    map['morn'] = morn;
    return map;
  }
}

/// dt : 1623781615
/// sunrise : 1623751566
/// sunset : 1623797407
/// temp : 27.94
/// feels_like : 29.05
/// pressure : 1016
/// humidity : 57
/// dew_point : 18.64
/// uvi : 9.79
/// clouds : 40
/// visibility : 10000
/// wind_speed : 1.34
/// wind_deg : 225
/// wind_gust : 4.02
/// weather : [{'id':802,'main':'Clouds','description':'nubes dispersas','icon':'03d'}]

class Current {
  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  double? feelsLike;
  /*int pressure;
  int humidity;
  double dewPoint;
  double uvi;
  int clouds;
  int visibility;
  double windSpeed;
  int windDeg;
  double windGust;*/
  List<Weather>? weather;

  Current(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.weather});

  Current.fromJson(dynamic json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = (json['temp'] as num).toDouble();
    feelsLike = (json['feels_like'] as num).toDouble();
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['dt'] = dt;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    if (weather != null) {
      map['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
