import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:starter_core/constants/enums/languages_enum.dart';

import 'package:starter_infra/local_storage.dart';
import 'network_headers.dart';
import 'network_runtime.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (LocalStorage.hasToken) {
      final token = LocalStorage.authToken;
      final os = NetworkRuntime.config.os;
      final appVersion = NetworkRuntime.config.appVersion;
      options.headers[NetHeaders.os] = os;
      options.headers[NetHeaders.appVersion] = appVersion;
      options.headers[NetHeaders.auth] = '$token';
    }
    options.headers[NetHeaders.language] =
        Intl.getCurrentLocale() == kLangAr
            ? '${Intl.getCurrentLocale()}-sy'
            : Intl.getCurrentLocale() == kLangEn
                ? '${Intl.getCurrentLocale()}-us'
                : 'ku';

    return super.onRequest(options, handler);
  }
}
