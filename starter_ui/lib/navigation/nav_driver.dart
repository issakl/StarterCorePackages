import 'package:flutter/material.dart';
import 'package:starter_ui/navigation/base_screen_param.dart';
import 'package:starter_ui/ui_runtime.dart';

/// Backend behind [Nav]. The default [NavigatorNavDriver] uses Flutter's
/// imperative `Navigator` (named routes); an app that routes with another
/// router (e.g. GoRouter) installs its own driver via `Nav.driver`.
abstract class NavDriver {
  Future<T?> to<T extends Object?>(
    String routeName, {
    required BaseScreenParam? arguments,
    BuildContext? context,
    bool canGoBack = true,
  });

  Future<T?> replace<T extends Object?, TO extends Object?>(
    String routeName, {
    required BaseScreenParam? arguments,
    BuildContext? context,
    TO? result,
  });

  void pop<T extends Object?>([BuildContext? context, T? result]);

  /// Re-evaluates the current route (e.g. router redirects/guards).
  void refresh() {}
}

/// Navigator 1.0 / named routes implementation (the default).
class NavigatorNavDriver implements NavDriver {
  const NavigatorNavDriver();

  @override
  Future<T?> to<T extends Object?>(
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

  @override
  Future<T?> replace<T extends Object?, TO extends Object?>(
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

  @override
  void pop<T extends Object?>([BuildContext? context, T? result]) {
    final navigator = Navigator.of(context ?? UiRuntime.appContext!);
    if (navigator.canPop())
      navigator.pop<T>(result);
    else
      throw Exception("Can't go back to the previous screen");
  }

  @override
  void refresh() {}
}
