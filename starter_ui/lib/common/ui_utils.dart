import 'dart:io';

import 'package:starter_localization/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui/show_toast.dart';

/// Small presentation-layer helpers shared across the UI package.
class UiUtils {
  UiUtils._();

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
        showToast(S.current.errorOccurred);
      }
    } else {
      showToast(S.current.errorOccurred);
    }
  }
}
