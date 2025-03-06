import 'package:weather_bloc/features/weather/data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeather({required String city});
}
