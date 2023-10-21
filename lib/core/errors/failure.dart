import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});
  factory ServerFailure.fromDioError({required DioException dioException}) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errMessage: 'Connection timeout with server, please try again');
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errMessage: 'Send timeout with server, please try again');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errMessage: 'Receive timeout with server, please try again');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          statusCode: dioException.response!.statusCode!,
          response: dioException.response,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
            errMessage: 'Request to Api server was canceled, Please try again');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure(errMessage: 'No internet connnection');
        }
        return ServerFailure(errMessage: 'Unexpected error, please try again');

      default:
        return ServerFailure(
            errMessage: 'Opps something went wrong, please try again');
    }
  }
  factory ServerFailure.fromResponse(
      {required int statusCode, required dynamic response}) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: "Your request not found, Please try later");
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: "Internal server error, Please try later");
    } else {
      return ServerFailure(
          errMessage: 'Opps something went wrong, please try again');
    }
  }
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.errMessage});
}
