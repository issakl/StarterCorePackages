import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starter_ui/common/app_colors.dart';
import 'package:starter_ui/constants/app_constants.dart';
import 'package:starter_ui/theme/text_theme_styles.dart';

import '../common/language_utils.dart';
import '../ui_runtime.dart';
import 'custom_theme_colors.dart';
import 'ui_dimens.dart';

part 'dark/dark_theme.dart';
part 'light/light_theme.dart';

class ThemesData {
  static ThemeData lightTheme(Orientation orientation) {
    return _getLightTheme(
      orientation == Orientation.landscape ? 5.0 : 25.sp,
    );
  }

  static ThemeData darkTheme(Orientation orientation) {
    return _getDarkTheme(
      orientation == Orientation.landscape ? 5.0 : 25.sp,
    );
  }
}
