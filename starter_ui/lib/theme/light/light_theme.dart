part of '../themes_data.dart';

ThemeData _getLightTheme(double fontSizeDelta) {
  TextThemeStyles.fontSizeDelta = fontSizeDelta;
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryColorLight,
      secondary: AppColors.accentColorLight,
    ),
    fontFamily: LanguageUtils.isLTR()
        ? GoogleFonts.poppins().fontFamily
        : UiRuntime.appLanguage.toString() == AppConstants.LANG_AR
            ? GoogleFonts.cairo().fontFamily
            : GoogleFonts.notoNaskhArabic().fontFamily,
    textTheme: TextTheme(
      displayLarge: TextThemeStyles.displayLarge,
      displayMedium: TextThemeStyles.displayMedium,
      displaySmall: TextThemeStyles.displaySmall,
      headlineMedium: TextThemeStyles.headlineMedium,
      headlineSmall: TextThemeStyles.headlineSmall,
      titleLarge: TextThemeStyles.titleLarge,
      titleMedium: TextThemeStyles.titleMedium,
      titleSmall: TextThemeStyles.titleSmall,
      bodyLarge: TextThemeStyles.bodyLarge,
      bodyMedium: TextThemeStyles.bodyMedium,
      bodySmall: TextThemeStyles.bodySmall,
      labelLarge: TextThemeStyles.labelLarge,
      labelSmall: TextThemeStyles.labelSmall,
    ),
    extensions: [CustomThemeColors.light, UiDimens.active],
  );
}
