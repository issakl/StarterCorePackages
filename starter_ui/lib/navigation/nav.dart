import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_core/common/extensions/extensions.dart';
import 'package:starter_ui/navigation/base_screen_param.dart';
import 'package:starter_ui/ui_runtime.dart';

/// Class to make navigation calling shorter and faster to use.
///
/// Built on GoRouter: the app owns a `GoRouter` (`MaterialApp.router`) and
/// supplies a context through [UiRuntime.appContextProvider] so `Nav` can be
/// used without one.
class Nav {
  Nav._();

  /// Navigate to [routeName], which is either a GoRouter route *name* or a
  /// location/path (starting with `/`, optionally with a query string).
  ///
  /// [arguments] provides path parameters (named routes only), query
  /// parameters and the `extra` object. When [canGoBack] is false the
  /// navigation is not recorded in the browser history (`Router.neglect`).
  static void to<T extends Object?>(
    String routeName, {
    required BaseScreenParam? arguments,
    BuildContext? context,
    bool canGoBack = true,
  }) {
    final appConfigOrParamContext = (context ?? UiRuntime.appContext!);
    final location = _location(appConfigOrParamContext, routeName, arguments);
    final go = () => appConfigOrParamContext.go(
          location,
          extra: arguments?.extra,
        );
    if (canGoBack) {
      go();
    } else {
      Router.neglect(appConfigOrParamContext, go);
    }
  }

  /// Pop
  static void pop<T extends Object?>([BuildContext? context, T? result]) {
    if ((context ?? UiRuntime.appContext!).canPop())
      (context ?? UiRuntime.appContext!).pop(result);
    else
      throw Exception("Can't go back to the previous screen");
  }

  /// Re-evaluates the current location, re-running the router's redirects
  /// (route guards).
  static void refresh([BuildContext? context]) =>
      GoRouter.of(context ?? UiRuntime.appContext!).refresh();

  static String _location(
    BuildContext context,
    String routeName,
    BaseScreenParam? arguments,
  ) {
    final query = arguments?.queryParams ?? const <String, dynamic>{};
    if (routeName.startsWith('/')) {
      final uri = Uri.parse(routeName);
      final merged = <String, dynamic>{
        ...uri.queryParameters,
        ...query.map((k, v) => MapEntry(k, v.toString())),
      };
      return uri
          .replace(queryParameters: merged.isEmpty ? null : merged)
          .toString();
    }
    try {
      return context.namedLocation(
        routeName,
        queryParameters: query,
        pathParameters: arguments?.pathParams ?? {},
      );
    } catch (ex) {
      ex.toString().logE;
      return '-';
    }
  }
}
