import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../ui_runtime.dart';

class TextUtils {
  TextUtils._();

  /// Util function to get the size of a text, using the app's current
  /// locale/context and font-family choice via [UiRuntime] rather than
  /// reaching into app-specific config directly.
  static Size getTextSize(
    String text,
    TextStyle style, {
    double minWidth = 0,
    double maxWidth = double.infinity,
    int? maxLines,
  }) {
    final locale = UiRuntime.appLanguage;
    final context = UiRuntime.appContext;
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style.copyWith(
          fontFamily:
              style.fontFamily ?? UiRuntime.fontFamilyForLocaleProvider(locale),
        ),
      ),
      maxLines: maxLines,
      textDirection:
          locale.languageCode.startsWith(AppConstants.LANG_EN) ? TextDirection.ltr : TextDirection.rtl,
      textScaler: context != null ? MediaQuery.of(context).textScaler : TextScaler.noScaling,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.size;
  }
}
