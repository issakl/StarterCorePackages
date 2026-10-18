import 'dart:async';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:starter_core/constants/enums/languages_enum.dart';

import 'package:starter_infra/local_storage.dart';
import 'network_headers.dart';
import 'network_runtime.dart';

/// Single place where request headers are attached.
///
/// By default it adds the token/os/version/language headers from
/// [LocalStorage] and [NetworkRuntime]. An app with its own header sources
/// supplies [generalHeaders] and [secureHeaders] instead; the final headers
/// are `general` < headers set on the request < `secure`, where `secure`
/// applies only to requests flagged with [NetHeaders.secureRequestExtra].
class AuthInterceptor extends Interceptor {
  final FutureOr<Map<String, String>> Function()? generalHeaders;
  final FutureOr<Map<String, String>> Function()? secureHeaders;

  AuthInterceptor({this.generalHeaders, this.secureHeaders});

  bool get _customHeaders => generalHeaders != null || secureHeaders != null;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (_customHeaders) {
      final general = await generalHeaders?.call() ?? const {};
      final explicit = Map<String, dynamic>.of(options.headers);
      options.headers
        ..clear()
        ..addAll(general)
        ..addAll(explicit);
      if (options.extra[NetHeaders.secureRequestExtra] == true) {
        options.headers.addAll(await secureHeaders?.call() ?? const {});
      }
      return handler.next(options);
    }

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

    return handler.next(options);
  }
}
