class AppException implements Exception {
  final String? message;
  final String? prefix;
  AppException([this.message, this.prefix]);
  @override
  String toString() {
    return "${prefix ?? ''}${message ?? ''}".trim();
  }
}

class NoInternetEception extends AppException {
  NoInternetEception([String? message]) : super(message, 'No Internet');
}

class NoServiceFoundException extends AppException {
  NoServiceFoundException([String? message])
      : super(message, 'Service Not Found');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message, 'Unauthorised');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input: ');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Bad Request: ');
}
class NoInternetException extends AppException {
  NoInternetException([String? message]) : super(message, 'No Internet: ');
}

class InvalidFormatException extends AppException {
  InvalidFormatException([String? message])
      : super(message, 'Invalid Format: ');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Server Error: ');
}

class CacheException extends AppException {
  CacheException([String? message]) : super(message, 'Cache Error: ');
}

class UnknownException extends AppException {
  UnknownException([String? message]) : super(message, 'Unknown Error: ');
}

class NoLocalDataException extends AppException {
  NoLocalDataException([String? message]) : super(message, 'No Local Data: ');
}

class NoRemoteDataException extends AppException {
  NoRemoteDataException([String? message]) : super(message, 'No Remote Data: ');
}

class NoDataException extends AppException {
  NoDataException([String? message]) : super(message, 'No Data: ');
}
class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'Fetch Data: ');
}

