import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weather_bloc/core/error/app_exceptiopns.dart';
import 'package:weather_bloc/core/network/base_api_services.dart';

class NetworkApiServices implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));

      return _processResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet');
    } on TimeoutException {
      throw NoServiceFoundException('Service Not Found');
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<dynamic> postApi(String url,
      {Map<String, String>? headers, body}) async {
    try {
      final response = await http
          .post(Uri.parse(url), body: body, headers: headers)
          .timeout(const Duration(seconds: 50));
      return _processResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet');
    } on TimeoutException {
      throw NoServiceFoundException('Service Not Found');
    } catch (e) {
      rethrow;
    }
  }

  dynamic _processResponse(http.Response response) {
    if (response.body.isEmpty) {
      throw FetchDataException("Empty response from server");
    }

    final decodedBody = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
        if (decodedBody == null || decodedBody is! Map<String, dynamic>) {
          throw FetchDataException("Invalid response format");
        }
        return decodedBody;
      case 400:
        throw BadRequestException(
            decodedBody["error"]?["message"] ?? "Bad Request");
      case 401:
        throw UnauthorisedException("Unauthorized");
      case 500:
        throw ServerException("Internal Server Error");
      default:
        throw FetchDataException("Unexpected error: ${response.statusCode}");
    }
  }
}
