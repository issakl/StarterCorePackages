import 'enums/app_options_enum.dart';

/// Immutable app-level feature toggles. Defines the shape only — the app
/// supplies the actual values by constructing one of these once (see
/// `AppConfig` in the consuming app) rather than this package hardcoding
/// defaults for every app that depends on it.
class AppOptions {
  const AppOptions({
    required this.orientation,
    required this.errorViewOption,
    required this.changeLangRestart,
    required this.enableDioPrinting,
    required this.enableErrorCatcher,
    required this.forceLocationPermission,
    required this.enableNotification,
  });

  /// Orientation option
  final OrientationOptions orientation;

  /// Error viewer view options
  final ErrorWidgetOptions errorViewOption;

  /// If app restart on change language or not
  final bool changeLangRestart;

  /// Enable dio printing for debugging purposes
  final bool enableDioPrinting;

  /// Enable the global error catcher to handle any red screen with a report
  final bool enableErrorCatcher;

  /// force the user to enable location permission
  final bool forceLocationPermission;

  /// Enable notification (firebaseMessaging, localNotification)
  final bool enableNotification;
}
