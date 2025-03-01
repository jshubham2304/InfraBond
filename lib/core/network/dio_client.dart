import 'package:dio/dio.dart';
import 'package:hella_infra_app/core/constants/api_constant.dart';
import 'package:hella_infra_app/core/error/exception.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioClient {
  final Dio _dio;

  DioClient() : _dio = Dio() {
    _dio.options.connectTimeout = const Duration(milliseconds: ApiConstants.connectTimeout);
    _dio.options.receiveTimeout = const Duration(milliseconds: ApiConstants.receiveTimeout);
    _dio.options.responseType = ResponseType.json;

    // Add interceptors for logging, etc. if needed
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
      );

      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  void _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw NetworkException(
          message: 'Connection timeout. Please check your internet connection.',
        );
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final errorMessage = error.response?.data?['message'] ?? 'Server error occurred';

        if (statusCode == 401) {
          throw ServerException(message: 'Unauthorized. Please login again.');
        } else if (statusCode == 404) {
          throw ServerException(message: 'Resource not found.');
        } else {
          throw ServerException(message: errorMessage);
        }
      case DioExceptionType.cancel:
        throw ServerException(message: 'Request was cancelled');
      case DioExceptionType.unknown:
        if (error.message?.contains('SocketException') ?? false) {
          throw NetworkException(
            message: 'No internet connection. Please check your network.',
          );
        }
        throw ServerException(message: error.message ?? 'Unknown error occurred');
      default:
        throw ServerException(message: 'Something went wrong. Please try again later.');
    }
  }
}
