import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:starter_ui/ui/dialogs/custom_dialogs.dart';
import 'package:starter_ui/ui/error_ui/error_viewer/dialog/errv_dialog_options.dart';
import 'package:starter_localization/l10n.dart';

void showCustomErrorDialog({
  required BuildContext context,
  String? message,
  VoidCallback? callback,
  required ErrVDialogOptions errVDialogOptions,
}) {
  if (Platform.isIOS ||
      errVDialogOptions.errVDialogType == ErrVDialogType.message) {
    showCustomMessageDialog(
      context: context,
      content: message ?? "",
      title: errVDialogOptions.title ?? CoreS.current.oopsErrorMessage,
      onButtonPressed: errVDialogOptions.confirmOptions?.onBtnPressed ??
          (a) {
            Navigator.pop(context);
            if (callback != null) callback();
          },
      buttonText:
          errVDialogOptions.confirmOptions?.buttonText ?? CoreS.current.retry,
    );
  }
  if (Platform.isAndroid) {
    showCustomConfirmCancelDialog(
      mainContext: context,
      content: message ?? "",
      title: errVDialogOptions.title ?? CoreS.current.oopsErrorMessage,
      onConfirm: errVDialogOptions.confirmOptions?.onBtnPressed ??
          (dContext) {
            Navigator.pop(dContext);
            if (callback != null) callback();
          },
      // onCancel: (dContext) async => await SystemNavigator.pop(),
      onCancel: errVDialogOptions.cancelOptions?.onBtnPressed ??
          (dContext) async => Navigator.pop(dContext),
      confirmText:
          errVDialogOptions.confirmOptions?.buttonText ?? CoreS.current.retry,
      cancelText:
          errVDialogOptions.cancelOptions?.buttonText ?? CoreS.current.cancel,
      isDismissible: false,
    );
  }
}
