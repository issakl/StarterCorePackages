import 'package:starter_ui/ui_runtime.dart';
import 'package:flutter/material.dart';
import 'package:starter_ui/navigation/base_screen_param.dart';

/// Class to make navigation calling shorter and faster to use
class Nav {
  /// Push a named route. [arguments] is delivered as the route's
  /// `RouteSettings.arguments` (read it with
  /// `ModalRoute.of(context)!.settings.arguments`).
  ///
  /// When [canGoBack] is false the whole stack is cleared, so the pushed
  /// route becomes the new root (e.g. splash -> home, logout -> login).
  static Future<T?> to<T extends Object?>(
    String routeName, {
    required BaseScreenParam? arguments,
    BuildContext? context,
    bool canGoBack = true,
  }) {
    final navigator = Navigator.of(context ?? UiRuntime.appContext!);
    if (canGoBack) {
      return navigator.pushNamed<T>(routeName, arguments: arguments);
    }
    return navigator.pushNamedAndRemoveUntil<T>(
      routeName,
      (_) => false,
      arguments: arguments,
    );
  }

  /// Replace the current route with a named route.
  static Future<T?> replace<T extends Object?, TO extends Object?>(
    String routeName, {
    required BaseScreenParam? arguments,
    BuildContext? context,
    TO? result,
  }) {
    return Navigator.of(context ?? UiRuntime.appContext!)
        .pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  /// Pop
  static void pop<T extends Object?>([BuildContext? context, T? result]) {
    final navigator = Navigator.of(context ?? UiRuntime.appContext!);
    if (navigator.canPop())
      navigator.pop<T>(result);
    else
      throw Exception("Can't go back to the previous screen");
  }
}
