class Weather {
  String cod;
  int message;
  int cnt;
  List<WeatherList> list;
  City city;

  Weather({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory Weather.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('Invalid JSON structure for Weather');
    }

    List<WeatherList> list = [];
    if (json['list'] != null) {
      (json['list'] as List).forEach((element) {
        if (element is Map<String, dynamic>) {
          list.add(WeatherList.fromJson(element));
        }
      });
    }

    return Weather(
      cod: json['cod'] ?? '',
      message: json['message'] ?? 0,
      cnt: json['cnt'] ?? 0,
      list: list,
      city: City.fromJson(json['city'] ?? {}),
    );
  }
}

class WeatherList {
  int dt;
  Main main;
  List<WeatherElement> weather;
  Clouds clouds;
  Wind wind;
  int visibility;
  double pop;
  Rain rain;
  Sys sys;
  DateTime dtTxt;

  WeatherList({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.rain,
    required this.sys,
    required this.dtTxt,
  });

  factory WeatherList.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('Invalid JSON structure for WeatherList');
    }

    return WeatherList(
      dt: json['dt'] ?? 0,
      main: Main.fromJson(json['main'] ?? {}),
      weather: (json['weather'] as List? ?? [])
          .whereType<Map<String, dynamic>>()
          .map((weather) => WeatherElement.fromJson(weather))
          .toList(),
      clouds: Clouds.fromJson(json['clouds'] ?? {}),
      wind: Wind.fromJson(json['wind'] ?? {}),
      visibility: json['visibility'] ?? 0,
      pop: (json['pop'] ?? 0).toDouble(),
      rain: Rain.fromJson(json['rain'] ?? {}),
      sys: Sys.fromJson(json['sys'] ?? {}),
      dtTxt: DateTime.parse(json['dt_txt'] ?? ''),
    );
  }
}

class Clouds {
  int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'],
    );
  }
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int seaLevel;
  int grndLevel;
  int humidity;
  double tempKf;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('Invalid JSON structure for Main');
    }

    return Main(
      temp: (json['temp'] ?? 0.0).toDouble(),
      feelsLike: (json['feels_like'] ?? 0.0).toDouble(),
      tempMin: (json['temp_min'] ?? 0.0).toDouble(),
      tempMax: (json['temp_max'] ?? 0.0).toDouble(),
      pressure: json['pressure'] ?? 0,
      seaLevel: json['sea_level'] ?? 0,
      grndLevel: json['grnd_level'] ?? 0,
      humidity: json['humidity'] ?? 0,
      tempKf: (json['temp_kf'] ?? 0.0).toDouble(),
    );
  }
}

class Rain {
  double the3H;

  Rain({
    required this.the3H,
  });

  factory Rain.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException('Invalid JSON structure for Rain');
    }

    return Rain(
      the3H: (json['3h'] ?? 0.0).toDouble(),
    );
  }
}

class Sys {
  String pod;

  Sys({
    required this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      pod: json['pod'],
    );
  }
}

class WeatherElement {
  int id;
  String main;
  String description;
  String icon;

  WeatherElement({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherElement.fromJson(Map<String, dynamic> json) {
    return WeatherElement(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'].toDouble(),
      deg: json['deg'],
      gust: json['gust'].toDouble(),
    );
  }
}

class City {
  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      coord: Coord.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

class Coord {
  double lat;
  double lon;

  Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
    );
  }
}
