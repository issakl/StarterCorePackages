import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:starter_localization/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui/show_toast.dart';

/// Small presentation-layer helpers shared across the UI package.
class UiUtils {
  UiUtils._();

  /// Find if any widget has focus in the given [context] and unfocus it.
  static void unFocus(BuildContext context) {
    if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
  }

  /// Opens [url] in the platform's preferred external handler.
  static Future<void> launchURL(Uri url, {LaunchMode? mode}) async {
    if (await canLaunchUrl(url)) {
      try {
        final platformLaunchMode = Platform.isIOS
            ? LaunchMode.externalApplication
            : LaunchMode.externalNonBrowserApplication;

        await launchUrl(
          url,
          mode: mode ?? platformLaunchMode,
        );
      } catch (e) {
        showToast(CoreS.current.errorOccurred);
      }
    } else {
      showToast(CoreS.current.errorOccurred);
    }
  }

  /// Shares [link] via the platform share sheet, anchored to [context]
  /// (needed on iPad for the share popover's source rect).
  static Future<void> share({
    required BuildContext context,
    required Uri link,
  }) async {
    try {
      final box = context.findRenderObject() as RenderBox?;

      await Share.share(
        link.toString(),
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
    } catch (e) {
      showToast(CoreS.current.errorOccurred);
    }
  }
}
