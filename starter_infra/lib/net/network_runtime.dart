/// Runtime hooks that let the app inject its own configuration and behaviour
/// into the shared networking stack, so `starter_infra` never has to import
/// app- or feature-level code (e.g. AppConfig, AccountCubit).
///
/// The app sets these once during startup, e.g.:
///
/// ```dart
/// NetworkRuntime.config = AppNetworkConfig();          // backed by AppConfig
/// NetworkRuntime.onUnauthorized = () => AccountCubit().logout();
/// ```
library;

/// Values the networking stack needs from the host application.
abstract class NetworkConfig {
  /// Whether to attach the pretty Dio logger.
  bool get enableDioPrinting;

  /// Current platform label sent as a request header (e.g. "android").
  String get os;

  /// Current application version sent as a request header.
  String get appVersion;
}

/// Fallback used until the app installs its own config.
class _DefaultNetworkConfig implements NetworkConfig {
  const _DefaultNetworkConfig();

  @override
  bool get enableDioPrinting => false;

  @override
  String get os => '';

  @override
  String get appVersion => '';
}

/// Localised strings the networking stack needs. Supplied by the app (e.g.
/// backed by the generated `S` localization class) so `starter_infra` stays
/// free of any app-generated l10n.
abstract class NetworkStrings {
  String get generalError;
  String get cancelError;
  String get badCertificate;
  String get notValidResponse;
}

class _DefaultNetworkStrings implements NetworkStrings {
  const _DefaultNetworkStrings();

  @override
  String get generalError => 'Something went wrong';

  @override
  String get cancelError => 'Request cancelled';

  @override
  String get badCertificate => 'Bad certificate';

  @override
  String get notValidResponse => 'Not a valid response';
}

/// Invoked by the networking stack when a request comes back 401/403.
typedef UnauthorizedCallback = void Function();

/// Global, app-configurable entry points for the networking stack.
class NetworkRuntime {
  NetworkRuntime._();

  /// Host-provided configuration. Defaults to inert values.
  static NetworkConfig config = const _DefaultNetworkConfig();

  /// Host-provided reaction to an unauthorized response. Defaults to no-op.
  static UnauthorizedCallback onUnauthorized = _noop;

  /// Host-provided localised strings. Defaults to English fallbacks.
  static NetworkStrings strings = const _DefaultNetworkStrings();

  static void _noop() {}
}
