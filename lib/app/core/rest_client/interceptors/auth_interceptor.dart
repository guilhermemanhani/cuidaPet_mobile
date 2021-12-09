import 'package:cuidapet_mobile/app/core/helpers/constants.dart';
import 'package:dio/dio.dart';

import 'package:cuidapet_mobile/app/core/helpers/logger.dart';
import 'package:cuidapet_mobile/app/core/local_storages/local_security_storage.dart';
import 'package:cuidapet_mobile/app/core/local_storages/local_storage.dart';

class AuthInterceptor extends Interceptor {
  LocalStorage _localStorage;
  LocalSecurityStorage _localSecurityStorage;
  final Logger _log;

  AuthInterceptor({
    required LocalStorage localStorage,
    required LocalSecurityStorage localSecurityStorage,
    required Logger log,
  })  : _localStorage = localStorage,
        _localSecurityStorage = localSecurityStorage,
        _log = log;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra['auth_required'] == true) {
      final accessToken =
          await _localStorage.read<String>(Constants.ACCESS_TOKEN_KEY);
      if (accessToken == null) {
        // Logout!!!
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
