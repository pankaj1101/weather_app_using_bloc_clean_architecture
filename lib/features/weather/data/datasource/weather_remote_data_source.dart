import 'dart:developer';

import 'package:weather_bloc/config/constants/api_endpoints.dart';
import 'package:weather_bloc/core/network/network_api_services.dart';

abstract class WeatherDataSource {
  Future<dynamic> getWeather({required String city});
}

class WeatherRemoteDataSource implements WeatherDataSource {
  final NetworkApiServices networkApiServices;
  WeatherRemoteDataSource(this.networkApiServices);

  @override
  Future<dynamic> getWeather({required String city}) async {
    try {
      // base url
      String baseUrl = ApiEndpoints.baseUrl;
      // api key
      String apiKey = ApiEndpoints.apiKey;

      dynamic jsonResponse = await networkApiServices
          .getApi('$baseUrl?key=$apiKey&q=$city&days=4');

      return jsonResponse;
    } catch (e) {
      log(e.toString());
    }
  }
}
