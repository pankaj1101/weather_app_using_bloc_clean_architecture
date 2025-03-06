import '../../../../config/constants/constants.dart';
import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.locationName,
    required super.condition,
    required super.localtime,
    required super.temperatureC,
    required super.temperatureF,
    required super.conditionText,
    required super.conditionIcon,
    required super.humidity,
    required super.windSpeedKph,
    required super.pressureMb,
    required super.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      locationName: json['location']['name'],
      condition:
          _mapStringToWeatherCondition(json['current']['condition']['text']),
      localtime: json['current']['last_updated'],
      temperatureC: json['current']['temp_c'].toDouble(),
      temperatureF: json['current']['temp_f'].toDouble(),
      conditionText: json['current']['condition']['text'],
      conditionIcon: _formatIconUrl(json['current']['condition']['icon']),
      humidity: json['current']['humidity'],
      windSpeedKph: json['current']['wind_kph'].toDouble(),
      pressureMb: json['current']['pressure_mb'].toDouble(),
      forecast: Forecast.fromJson(json['forecast']),
    );
  }
  static String _formatIconUrl(String iconUrl) {
    if (iconUrl.startsWith('//')) {
      return 'https:$iconUrl';
    }
    return iconUrl;
  }

  static WeatherCondition _mapStringToWeatherCondition(String input) {
    WeatherCondition state;
    switch (input.toLowerCase()) {
      case 'snow':
        state = WeatherCondition.snow;
        break;
      case 'sleet':
        state = WeatherCondition.sleet;
        break;
      case 'hail':
        state = WeatherCondition.hail;
        break;
      case 'thunderstorm':
        state = WeatherCondition.thunderstorm;
        break;
      case 'heavyrain':
        state = WeatherCondition.heavyRain;
        break;
      case 'lightrain':
        state = WeatherCondition.lightRain;
        break;
      case 'showers':
        state = WeatherCondition.showers;
        break;
      case 'heavycloud':
        state = WeatherCondition.heavyCloud;
        break;
      case 'lightcloud':
        state = WeatherCondition.lightCloud;
        break;
      case 'clear':
      case 'sunny':
        state = WeatherCondition.clear;
        break;
      default:
        state = WeatherCondition.unknown;
    }
    return state;
  }
}
