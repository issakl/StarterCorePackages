import 'package:flutter/material.dart';
import 'package:starter_ui/navigation/base_screen_param.dart';
import 'package:starter_ui/navigation/nav_driver.dart';

/// Class to make navigation calling shorter and faster to use.
///
/// Calls are delegated to [driver], which defaults to the Flutter `Navigator`
/// named-route implementation. Apps using another router install their own
/// [NavDriver] once at startup (`Nav.driver = MyDriver()`).
class Nav {
  Nav._();

  static NavDriver driver = const NavigatorNavDriver();

  /// Push a named route. [arguments] is delivered to the destination (for the
  /// default driver as `RouteSettings.arguments`).
  ///
  /// When [canGoBack] is false the whole stack is cleared, so the pushed
  /// route becomes the new root (e.g. splash -> home, logout -> login).
  static Future<T?> to<T extends Object?>(
    String routeName, {
    required BaseScreenParam? arguments,
    BuildContext? context,
    bool canGoBack = true,
  }) =>
      driver.to<T>(routeName,
          arguments: arguments, context: context, canGoBack: canGoBack);

  /// Replace the current route with a named route.
  static Future<T?> replace<T extends Object?, TO extends Object?>(
    String routeName, {
    required BaseScreenParam? arguments,
    BuildContext? context,
    TO? result,
  }) =>
      driver.replace<T, TO>(routeName,
          arguments: arguments, context: context, result: result);

  /// Pop
  static void pop<T extends Object?>([BuildContext? context, T? result]) =>
      driver.pop<T>(context, result);

  /// Re-evaluate the current route (router redirects/guards).
  static void refresh() => driver.refresh();
}
