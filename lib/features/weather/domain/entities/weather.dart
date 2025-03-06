import '../../../../config/constants/constants.dart';

class Weather {
  final WeatherCondition condition;
  final String locationName;
  final String localtime;
  final num temperatureC;
  final num temperatureF;
  final String conditionText;
  final String conditionIcon;
  final num humidity;
  final num windSpeedKph;
  final num pressureMb;
  Forecast? forecast;

  Weather({
    required this.locationName,
    required this.localtime,
    required this.temperatureC,
    required this.temperatureF,
    required this.conditionText,
    required this.conditionIcon,
    required this.condition,
    required this.humidity,
    required this.windSpeedKph,
    required this.pressureMb,
    this.forecast,
  });
}

class Forecast {
  List<Forecastday>? forecastday;
  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(Forecastday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (forecastday != null) {
      data['forecastday'] = forecastday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Forecastday {
  String? date;
  Day? day;

  Forecastday({
    this.date,
    this.day,
  });

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (day != null) {
      data['day'] = day!.toJson();
    }
    return data;
  }
}

class Day {
  num? avgtempC;
  num? avgtempF;
  Condition? condition;

  Day({
    this.avgtempC,
    this.avgtempF,
    this.condition,
  });

  Day.fromJson(Map<String, dynamic> json) {
    avgtempC = json['avgtemp_c'];
    avgtempF = json['avgtemp_f'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avgtemp_c'] = avgtempC;
    data['avgtemp_f'] = avgtempF;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    return data;
  }
}

class Condition {
  String? text;
  String? icon;

  Condition({this.text, this.icon});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['icon'] = icon;
    return data;
  }
}
