/// HTTP header names used by the shared networking stack. Kept here (rather
/// than in an app-level constants grab-bag) so `starter_infra` is self-contained.
class NetHeaders {
  NetHeaders._();

  static const String os = 'os';
  static const String appVersion = 'appversion';
  static const String auth = 'authorization';
  static const String language = 'Accept-Language';

  /// `RequestOptions.extra` key marking a request that needs the secure
  /// (authenticated) headers from [AuthInterceptor.secureHeaders].
  static const String secureRequestExtra = 'secureRequest';
}
