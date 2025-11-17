import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:beit_alnakha_admin/config/local/cache_helper_secure.dart';
import 'package:beit_alnakha_admin/config/local/cache_helper_keys.dart';
import 'package:beit_alnakha_admin/core/api/status_code.dart';
import 'package:beit_alnakha_admin/core/functions/logout.dart';
import 'end_points.dart';

@LazySingleton()
class AppInterceptors extends Interceptor {
  late final Dio dio;

  AppInterceptors() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? authToken = await CacheHelperSecure.getData(
      key: CacheHelperKeys.accessToken,
    );
    if (authToken != null && authToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $authToken';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // ToDo
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if(!kReleaseMode){
      debugPrint("err.response?.statusCode ${err.response?.statusCode}");
    }

    if (err.response?.statusCode == StatusCode.unauthorized) {
      try {
        String? accessToken = await CacheHelperSecure.getData(
          key: CacheHelperKeys.accessToken,
        );
        String? refreshToken = await CacheHelperSecure.getData(
          key: CacheHelperKeys.refreshToken,
        );

        if(!kReleaseMode){
          debugPrint(accessToken);
          debugPrint(refreshToken);
        }

        if (refreshToken != null && refreshToken.isNotEmpty) {
          dio.options.baseUrl = EndPoints.baseUrl;
          final refreshResponse = await dio.post(
            EndPoints.refreshToken,
            data: {"token": refreshToken},
          );

          if (refreshResponse.data?["accessToken"] != null) {
            String newToken = refreshResponse.data["accessToken"];
            await CacheHelperSecure.setData(
              value: newToken,
              key: CacheHelperKeys.accessToken,
            );
            if(!kReleaseMode){
            debugPrint('newToken$newToken');
            }
            // Update the original request with new token
            err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
            return handler.resolve(await dio.fetch(err.requestOptions));
          } else {
            // Handle invalid refresh response
            if(!kReleaseMode){
            debugPrint('Invalid refresh response: ${refreshResponse.data}');
            }
            logout();
            return handler.reject(err);
          }
        } else {
          logout();
          if(!kReleaseMode){
          debugPrint('Refresh token not found');
          }
          return handler.reject(err);
        }
      } catch (e) {
        if(!kReleaseMode){
          debugPrint('Token refresh failed: $e');
        }
        logout();
        return handler.reject(err);
      }
    } else if (err.response?.statusCode == StatusCode.forbidden) {
      if(!kReleaseMode){
        debugPrint('Forbidden error occurred');
      }
      logout();
    }

    super.onError(err, handler);
  }
}
