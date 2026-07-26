import 'package:starter_ui/ui_runtime.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_core/common/extensions/extensions.dart';
import 'package:starter_ui/navigation/base_screen_param.dart';

/// Class to make navigation calling shorter and faster to use
class Nav {
  /// Push
  static void to<T extends Object?>(
    String routeName, {
    required BaseScreenParam? arguments,
    BuildContext? context,
    bool canGoBack = true,
  }) {
    String location = '-';
    final appConfigOrParamContext = (context ?? UiRuntime.appContext!);
    try {
      location = appConfigOrParamContext.namedLocation(
        routeName,
        queryParameters: arguments?.queryParams ?? {},
        pathParameters: arguments?.pathParams ?? {},
      );
    } catch (ex) {
      ex.toString().logE;
    }
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
}
