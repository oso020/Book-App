import 'package:dio/dio.dart';

abstract class Faluier {
  final String errorMessage;

  Faluier(this.errorMessage);
}

class ServerFaluier extends Faluier {
  ServerFaluier(super.errorMessage);

  factory ServerFaluier.fromDioError(DioException dio) {
    switch (dio.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaluier('Connection api is timeout');
      case DioExceptionType.sendTimeout:
        return ServerFaluier('Send connection api is timeout');

      case DioExceptionType.receiveTimeout:
        return ServerFaluier('Receive connection api is timeout');

      case DioExceptionType.badCertificate:
        return ServerFaluier('badCertificate with api server');

      case DioExceptionType.badResponse:
        return ServerFaluier.fromResponse(dio.response!.statusCode!, dio.response!.data);
      case DioExceptionType.cancel:
        return ServerFaluier('Request to server was canceled');

      case DioExceptionType.connectionError:
        return ServerFaluier('No internet connction');

      case DioExceptionType.unknown:
        return ServerFaluier('Some thing is went Wrong please try later');
    }
  }
  factory ServerFaluier.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFaluier('Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFaluier('There is a problem with server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFaluier(response['error']['message']);
    } else {
      return ServerFaluier('There was an error , please try again');
    }
  }
}
