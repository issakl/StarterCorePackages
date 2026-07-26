import 'package:flutter/material.dart';

/// Sizing tokens for the shared widgets in `starter_ui` (dialogs, error
/// screens, text fields, list tiles, etc.), exposed as a [ThemeExtension] so
/// each app can retune proportions for its own product without forking widget
/// files. All values are in ScreenUtil design units — call sites apply the
/// same `.w/.h/.sp/.r` (or `ScreenUtil().setX`) scaling they always did.
///
/// [standard] preserves the exact values the widgets were originally authored
/// with, so wiring this in changes no app's visuals until it opts into an
/// override.
@immutable
class UiDimens extends ThemeExtension<UiDimens> {
  // ---- Error / empty-state illustrations & content ----
  final double illustrationSizeSM;
  final double illustrationSizeLG;
  final double errorImageWidth;
  final double errorSectionGap;
  final double errorContentWidth;
  final double errorContentHeight;
  final double errorContentFontSize;
  final double errorButtonFontSize;

  // ---- Dialog family (message dialogs, custom dialogs) ----
  final double dialogCornerRadius;
  final double dialogAvatarRadius;
  final double dialogIconSize;
  final double dialogIconContainerSize;
  final double dialogSpacerWidth;
  final double dialogImageWidth;
  final double dialogContentHeight;
  final double dialogFieldSpacing;
  final double dialogFontSM;
  final double dialogFontMD;
  final double dialogFontLG;
  final double dialogFontXL;
  final double dialogSecondaryMessageFontSize;

  // ---- Permission dialog ----
  final double permissionTitleFontSize;
  final double permissionBodyFontSize;
  final double permissionButtonRadius;

  // ---- Text field ----
  final double textFieldIconGap;
  final double textFieldControlSize;
  final double textFieldIconBoxSize;
  final double textFieldIconSize;

  // ---- List tile ----
  final double listTileIconSize;

  // ---- Waiting indicator ----
  final double waitingIndicatorSize;

  const UiDimens({
    required this.illustrationSizeSM,
    required this.illustrationSizeLG,
    required this.errorImageWidth,
    required this.errorSectionGap,
    required this.errorContentWidth,
    required this.errorContentHeight,
    required this.errorContentFontSize,
    required this.errorButtonFontSize,
    required this.dialogCornerRadius,
    required this.dialogAvatarRadius,
    required this.dialogIconSize,
    required this.dialogIconContainerSize,
    required this.dialogSpacerWidth,
    required this.dialogImageWidth,
    required this.dialogContentHeight,
    required this.dialogFieldSpacing,
    required this.dialogFontSM,
    required this.dialogFontMD,
    required this.dialogFontLG,
    required this.dialogFontXL,
    required this.dialogSecondaryMessageFontSize,
    required this.permissionTitleFontSize,
    required this.permissionBodyFontSize,
    required this.permissionButtonRadius,
    required this.textFieldIconGap,
    required this.textFieldControlSize,
    required this.textFieldIconBoxSize,
    required this.textFieldIconSize,
    required this.listTileIconSize,
    required this.waitingIndicatorSize,
  });

  /// The [UiDimens] the shared themes build with. Defaults to [standard];
  /// an app overrides this once at startup (before building its theme, e.g.
  /// alongside `TextThemeStyles.fontSizeDelta`) to retune shared-widget
  /// proportions without forking any widget file:
  ///
  /// ```dart
  /// UiDimens.active = UiDimens.standard.copyWith(dialogFontXL: 48);
  /// ```
  static UiDimens active = standard;

  /// The values every shared widget was originally authored with.
  static const UiDimens standard = UiDimens(
    illustrationSizeSM: 200,
    illustrationSizeLG: 500,
    errorImageWidth: 450,
    errorSectionGap: 100,
    errorContentWidth: 800,
    errorContentHeight: 200,
    errorContentFontSize: 40,
    errorButtonFontSize: 38,
    dialogCornerRadius: 60,
    dialogAvatarRadius: 50,
    dialogIconSize: 80,
    dialogIconContainerSize: 150,
    dialogSpacerWidth: 25,
    dialogImageWidth: 230,
    dialogContentHeight: 280,
    dialogFieldSpacing: 35,
    dialogFontSM: 32,
    dialogFontMD: 36,
    dialogFontLG: 40,
    dialogFontXL: 42,
    dialogSecondaryMessageFontSize: 35,
    permissionTitleFontSize: 50,
    permissionBodyFontSize: 35,
    permissionButtonRadius: 35,
    textFieldIconGap: 16,
    textFieldControlSize: 32,
    textFieldIconBoxSize: 50,
    textFieldIconSize: 55,
    listTileIconSize: 32,
    waitingIndicatorSize: 40,
  );

  @override
  UiDimens copyWith({
    double? illustrationSizeSM,
    double? illustrationSizeLG,
    double? errorImageWidth,
    double? errorSectionGap,
    double? errorContentWidth,
    double? errorContentHeight,
    double? errorContentFontSize,
    double? errorButtonFontSize,
    double? dialogCornerRadius,
    double? dialogAvatarRadius,
    double? dialogIconSize,
    double? dialogIconContainerSize,
    double? dialogSpacerWidth,
    double? dialogImageWidth,
    double? dialogContentHeight,
    double? dialogFieldSpacing,
    double? dialogFontSM,
    double? dialogFontMD,
    double? dialogFontLG,
    double? dialogFontXL,
    double? dialogSecondaryMessageFontSize,
    double? permissionTitleFontSize,
    double? permissionBodyFontSize,
    double? permissionButtonRadius,
    double? textFieldIconGap,
    double? textFieldControlSize,
    double? textFieldIconBoxSize,
    double? textFieldIconSize,
    double? listTileIconSize,
    double? waitingIndicatorSize,
  }) {
    return UiDimens(
      illustrationSizeSM: illustrationSizeSM ?? this.illustrationSizeSM,
      illustrationSizeLG: illustrationSizeLG ?? this.illustrationSizeLG,
      errorImageWidth: errorImageWidth ?? this.errorImageWidth,
      errorSectionGap: errorSectionGap ?? this.errorSectionGap,
      errorContentWidth: errorContentWidth ?? this.errorContentWidth,
      errorContentHeight: errorContentHeight ?? this.errorContentHeight,
      errorContentFontSize:
          errorContentFontSize ?? this.errorContentFontSize,
      errorButtonFontSize: errorButtonFontSize ?? this.errorButtonFontSize,
      dialogCornerRadius: dialogCornerRadius ?? this.dialogCornerRadius,
      dialogAvatarRadius: dialogAvatarRadius ?? this.dialogAvatarRadius,
      dialogIconSize: dialogIconSize ?? this.dialogIconSize,
      dialogIconContainerSize:
          dialogIconContainerSize ?? this.dialogIconContainerSize,
      dialogSpacerWidth: dialogSpacerWidth ?? this.dialogSpacerWidth,
      dialogImageWidth: dialogImageWidth ?? this.dialogImageWidth,
      dialogContentHeight: dialogContentHeight ?? this.dialogContentHeight,
      dialogFieldSpacing: dialogFieldSpacing ?? this.dialogFieldSpacing,
      dialogFontSM: dialogFontSM ?? this.dialogFontSM,
      dialogFontMD: dialogFontMD ?? this.dialogFontMD,
      dialogFontLG: dialogFontLG ?? this.dialogFontLG,
      dialogFontXL: dialogFontXL ?? this.dialogFontXL,
      dialogSecondaryMessageFontSize: dialogSecondaryMessageFontSize ??
          this.dialogSecondaryMessageFontSize,
      permissionTitleFontSize:
          permissionTitleFontSize ?? this.permissionTitleFontSize,
      permissionBodyFontSize:
          permissionBodyFontSize ?? this.permissionBodyFontSize,
      permissionButtonRadius:
          permissionButtonRadius ?? this.permissionButtonRadius,
      textFieldIconGap: textFieldIconGap ?? this.textFieldIconGap,
      textFieldControlSize: textFieldControlSize ?? this.textFieldControlSize,
      textFieldIconBoxSize: textFieldIconBoxSize ?? this.textFieldIconBoxSize,
      textFieldIconSize: textFieldIconSize ?? this.textFieldIconSize,
      listTileIconSize: listTileIconSize ?? this.listTileIconSize,
      waitingIndicatorSize: waitingIndicatorSize ?? this.waitingIndicatorSize,
    );
  }

  @override
  UiDimens lerp(ThemeExtension<UiDimens>? other, double t) {
    if (other is! UiDimens) return this;
    double l(double a, double b) => a + (b - a) * t;
    return UiDimens(
      illustrationSizeSM: l(illustrationSizeSM, other.illustrationSizeSM),
      illustrationSizeLG: l(illustrationSizeLG, other.illustrationSizeLG),
      errorImageWidth: l(errorImageWidth, other.errorImageWidth),
      errorSectionGap: l(errorSectionGap, other.errorSectionGap),
      errorContentWidth: l(errorContentWidth, other.errorContentWidth),
      errorContentHeight: l(errorContentHeight, other.errorContentHeight),
      errorContentFontSize:
          l(errorContentFontSize, other.errorContentFontSize),
      errorButtonFontSize: l(errorButtonFontSize, other.errorButtonFontSize),
      dialogCornerRadius: l(dialogCornerRadius, other.dialogCornerRadius),
      dialogAvatarRadius: l(dialogAvatarRadius, other.dialogAvatarRadius),
      dialogIconSize: l(dialogIconSize, other.dialogIconSize),
      dialogIconContainerSize:
          l(dialogIconContainerSize, other.dialogIconContainerSize),
      dialogSpacerWidth: l(dialogSpacerWidth, other.dialogSpacerWidth),
      dialogImageWidth: l(dialogImageWidth, other.dialogImageWidth),
      dialogContentHeight: l(dialogContentHeight, other.dialogContentHeight),
      dialogFieldSpacing: l(dialogFieldSpacing, other.dialogFieldSpacing),
      dialogFontSM: l(dialogFontSM, other.dialogFontSM),
      dialogFontMD: l(dialogFontMD, other.dialogFontMD),
      dialogFontLG: l(dialogFontLG, other.dialogFontLG),
      dialogFontXL: l(dialogFontXL, other.dialogFontXL),
      dialogSecondaryMessageFontSize: l(dialogSecondaryMessageFontSize,
          other.dialogSecondaryMessageFontSize),
      permissionTitleFontSize:
          l(permissionTitleFontSize, other.permissionTitleFontSize),
      permissionBodyFontSize:
          l(permissionBodyFontSize, other.permissionBodyFontSize),
      permissionButtonRadius:
          l(permissionButtonRadius, other.permissionButtonRadius),
      textFieldIconGap: l(textFieldIconGap, other.textFieldIconGap),
      textFieldControlSize:
          l(textFieldControlSize, other.textFieldControlSize),
      textFieldIconBoxSize:
          l(textFieldIconBoxSize, other.textFieldIconBoxSize),
      textFieldIconSize: l(textFieldIconSize, other.textFieldIconSize),
      listTileIconSize: l(listTileIconSize, other.listTileIconSize),
      waitingIndicatorSize: l(waitingIndicatorSize, other.waitingIndicatorSize),
    );
  }
}

extension UiDimensContext on BuildContext {
  /// The current theme's [UiDimens], falling back to [UiDimens.active] if the
  /// current theme didn't register one.
  UiDimens get uiDimens =>
      Theme.of(this).extension<UiDimens>() ?? UiDimens.active;
}
