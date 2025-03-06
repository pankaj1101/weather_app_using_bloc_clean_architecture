import 'package:weather_bloc/features/weather/data/datasource/weather_remote_data_source.dart';
import 'package:weather_bloc/features/weather/data/models/weather_model.dart';
import 'package:weather_bloc/features/weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource weatherDataSource;
  WeatherRepositoryImpl(this.weatherDataSource);

  @override
  Future<WeatherModel> getWeather({required String city}) async {
    final res = await weatherDataSource.getWeather(city: city);
    return WeatherModel.fromJson(res);
  }
}
