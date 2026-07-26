import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

import '../theme/themes_data.dart';

class ThemeUtils {
  ThemeUtils._();

  /// Flips between the light/dark themes built by [ThemesData], via
  /// [ThemeSwitcher]. Takes the [current] mode and returns the new one —
  /// persisting it (and updating whatever app-level config holds it) is the
  /// caller's job, since that's app-specific state this package doesn't own.
  static ThemeMode toggleTheme(BuildContext context, {required ThemeMode current}) {
    final orientation = MediaQuery.of(context).orientation;
    final next = current == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    ThemeSwitcher.of(context).changeTheme(
      theme: next == ThemeMode.dark ? ThemesData.darkTheme(orientation) : ThemesData.lightTheme(orientation),
      isReversed: current == ThemeMode.dark,
    );

    return next;
  }
}
