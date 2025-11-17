import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:dio/dio.dart';

abstract class Failure {
  final String error;

  const Failure(this.error);
}

class ServerFailure extends Failure {
  ServerFailure(super.error);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(AppStrings.connectionTimeoutErrorMessage);
      // return ServerFailure(
      //     'Connection timeout. Please check your internet connection.');
      case DioExceptionType.sendTimeout:
        return ServerFailure(AppStrings.sendTimeoutErrorMessage);
      // return ServerFailure(
      //     'Send timeout. Unable to send request. Please try again.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(AppStrings.receiveTimeoutErrorMessage);
      // return ServerFailure(
      //     'Receive timeout. Unable to receive data. Please try again.');
      case DioExceptionType.badCertificate:
        return ServerFailure(AppStrings.badCertificateErrorMessage);
      //return ServerFailure(
      //  'Bad certificate. Secure connection could not be established.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromDioResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(AppStrings.cancelErrorMessage);
      // return ServerFailure('Request was canceled.');
      case DioExceptionType.connectionError:
        return ServerFailure(AppStrings.connectionErrorMessage);
      //   return ServerFailure('Please check your internet connection and try again.');
      case DioExceptionType.unknown:
        return ServerFailure(AppStrings.unknownErrorMessage);
      // return ServerFailure('Unexpected Error, Please try again.');
    }
  }

  factory ServerFailure.fromDioResponse(int statsCode, dynamic response) {
    switch (statsCode) {
      case 401:
      case 402:
      case 403:
      case 422:
      case 404:
      case 413:
      case 400:
        return ServerFailure(response['message']);
      case 500:
        return ServerFailure(AppStrings.statusCode500ErrorMessage);
      // return ServerFailure('Internal server error, Please try later!');
      default:
        return ServerFailure(AppStrings.defaultErrorMessage);
      // return ServerFailure('Opps there was an error, Please try again!');
    }
  }
}
