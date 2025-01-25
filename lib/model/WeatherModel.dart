import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Location location;
  Current current;
  Forecast forecast;

  Weather({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    location: Location.fromJson(json["location"]),
    current: Current.fromJson(json["current"]),
    forecast: Forecast.fromJson(json["forecast"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "current": current.toJson(),
    "forecast": forecast.toJson(),
  };
}

class Current {
  double tempC;
  int isDay;
  Condition condition;


  Current({
    required this.tempC,
    required this.isDay,
    required this.condition,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    tempC: json["temp_c"]?.toDouble(),
    isDay: json["is_day"],
    condition: Condition.fromJson(json["condition"]),
  );

  Map<String, dynamic> toJson() => {
    "temp_c": tempC,
    "is_day": isDay,
    "condition": condition.toJson(),
  };
}

class Condition {
  TextWeather text;
  IconWeather icon;
  int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: textValues.map[json["text"]]!,
    icon: iconValues.map[json["icon"]]!,
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "text": textValues.reverse[text],
    "icon": iconValues.reverse[icon],
    "code": code,
  };
}

enum IconWeather {
  CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_113_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_116_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_119_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_122_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_113_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_116_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_119_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_122_PNG
}

final iconValues = EnumValues({
  "//cdn.weatherapi.com/weather/64x64/day/113.png": IconWeather.CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_113_PNG,
  "//cdn.weatherapi.com/weather/64x64/day/116.png": IconWeather.CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_116_PNG,
  "//cdn.weatherapi.com/weather/64x64/day/119.png": IconWeather.CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_119_PNG,
  "//cdn.weatherapi.com/weather/64x64/day/122.png": IconWeather.CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_122_PNG,
  "//cdn.weatherapi.com/weather/64x64/night/113.png": IconWeather.CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_113_PNG,
  "//cdn.weatherapi.com/weather/64x64/night/116.png": IconWeather.CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_116_PNG,
  "//cdn.weatherapi.com/weather/64x64/night/119.png": IconWeather.CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_119_PNG,
  "//cdn.weatherapi.com/weather/64x64/night/122.png": IconWeather.CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_122_PNG
});

enum TextWeather {
  CLEAR,
  CLOUDY,
  OVERCAST,
  PARTLY_CLOUDY,
  SUNNY,
  TEXT_CLEAR
}

final textValues = EnumValues({
  "Clear": TextWeather.CLEAR,
  "Cloudy ": TextWeather.CLOUDY,
  "Overcast ": TextWeather.OVERCAST,
  "Partly Cloudy ": TextWeather.PARTLY_CLOUDY,
  "Sunny": TextWeather.SUNNY,
  "Clear ": TextWeather.TEXT_CLEAR
});

enum WindDir {
  E,
  ENE,
  ESE,
  N,
  NE,
  NNE,
  NNW,
  NW,
  SE,
  SW,
  WNW
}

final windDirValues = EnumValues({
  "E": WindDir.E,
  "ENE": WindDir.ENE,
  "ESE": WindDir.ESE,
  "N": WindDir.N,
  "NE": WindDir.NE,
  "NNE": WindDir.NNE,
  "NNW": WindDir.NNW,
  "NW": WindDir.NW,
  "SE": WindDir.SE,
  "SW": WindDir.SW,
  "WNW": WindDir.WNW
});

class Forecast {
  List<Forecastday> forecastday;

  Forecast({
    required this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
    forecastday: List<Forecastday>.from(json["forecastday"].map((x) => Forecastday.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "forecastday": List<dynamic>.from(forecastday.map((x) => x.toJson())),
  };
}

class Forecastday {
  DateTime date;
  int dateEpoch;
  Day day;
  Astro astro;

  Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
    date: DateTime.parse(json["date"]),
    dateEpoch: json["date_epoch"],
    day: Day.fromJson(json["day"]),
    astro: Astro.fromJson(json["astro"]),
  );

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "date_epoch": dateEpoch,
    "day": day.toJson(),
    "astro": astro.toJson(),
  };
}

class Astro {
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String moonPhase;
  int moonIllumination;
  int isMoonUp;
  int isSunUp;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    moonrise: json["moonrise"],
    moonset: json["moonset"],
    moonPhase: json["moon_phase"],
    moonIllumination: json["moon_illumination"],
    isMoonUp: json["is_moon_up"],
    isSunUp: json["is_sun_up"],
  );

  Map<String, dynamic> toJson() => {
    "sunrise": sunrise,
    "sunset": sunset,
    "moonrise": moonrise,
    "moonset": moonset,
    "moon_phase": moonPhase,
    "moon_illumination": moonIllumination,
    "is_moon_up": isMoonUp,
    "is_sun_up": isSunUp,
  };
}

class Day {
  double maxtempC;
  double mintempC;
  double avgtempC;
  double avgtempF;
  double maxwindMph;
  double maxwindKph;
  Condition condition;
  double uv;

  Day({
    required this.maxtempC,
    required this.mintempC,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.condition,
    required this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    maxtempC: json["maxtemp_c"]?.toDouble(),
    mintempC: json["mintemp_c"]?.toDouble(),
    avgtempC: json["avgtemp_c"]?.toDouble(),
    avgtempF: json["avgtemp_f"]?.toDouble(),
    maxwindMph: json["maxwind_mph"]?.toDouble(),
    maxwindKph: json["maxwind_kph"]?.toDouble(),
    condition: Condition.fromJson(json["condition"]),
    uv: json["uv"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "maxtemp_c": maxtempC,
    "mintemp_c": mintempC,
    "avgtemp_c": avgtempC,
    "avgtemp_f": avgtempF,
    "maxwind_mph": maxwindMph,
    "maxwind_kph": maxwindKph,
    "condition": condition.toJson(),
    "uv": uv,
  };
}

class Location {
  String name;
  String region;
  String country;


  Location({
    required this.name,
    required this.region,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    region: json["region"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
    "country": country,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}