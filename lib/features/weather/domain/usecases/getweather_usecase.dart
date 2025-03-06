import 'package:weather_bloc/core/usecases/usecases.dart';

import 'package:weather_bloc/features/weather/domain/entities/weather.dart';

import '../repository/weather_repository.dart';

class GetweatherUsecase implements Usecase<Weather, String> {
  final WeatherRepository repository;

  GetweatherUsecase(this.repository);

  @override
  Future<Weather> call({required String params}) async {
    return await repository.getWeather(city: params);
  }
}
