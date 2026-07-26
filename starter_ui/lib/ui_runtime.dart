import 'package:flutter/widgets.dart';
import 'package:starter_core/constants/enums/app_options_enum.dart';

/// App-provided runtime state and behaviour the shared UI needs, injected once
/// during startup so `starter_ui` never imports app- or feature-level code
/// (AppConfig, LocalizationProvider, the concrete route table, etc.).
///
/// The app installs these in its own setup, e.g.:
///
/// ```dart
/// UiRuntime.appContextProvider = () => AppConfig().appContext;
/// UiRuntime.appLanguageProvider = () => AppConfig().appLanguage;
/// UiRuntime.changeLangRestartProvider = () => AppConfig().appOptions.changeLangRestart;
/// UiRuntime.errorViewOptionProvider = () => AppConfig().appOptions.errorViewOption;
/// UiRuntime.onRefreshRouter = () => GetIt.I<NavigationRoute>().refreshRouter();
/// UiRuntime.onChangeLanguage = (context, locale) =>
///     LocalizationProvider().changeLanguage(locale, context);
/// ```
class UiRuntime {
  UiRuntime._();

  /// Global navigator/app context.
  static BuildContext? Function() appContextProvider = () => null;
  static BuildContext? get appContext => appContextProvider();

  /// Current app locale.
  static Locale Function() appLanguageProvider = () => const Locale('en');
  static Locale get appLanguage => appLanguageProvider();

  /// Whether changing language should restart the app.
  static bool Function() changeLangRestartProvider = () => false;
  static bool get changeLangRestart => changeLangRestartProvider();

  /// How error screens render their illustration.
  static ErrorWidgetOptions Function() errorViewOptionProvider =
      () => ErrorWidgetOptions.LOTTIE;
  static ErrorWidgetOptions get errorViewOption => errorViewOptionProvider();

  /// Rebuilds the app's router (used after a restart).
  static VoidCallback onRefreshRouter = () {};

  /// Applies an app language change.
  static Future<void> Function(BuildContext context, Locale locale)
      onChangeLanguage = (_, __) async {};
}
