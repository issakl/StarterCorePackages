import 'package:flutter/foundation.dart';

/// Base class for `ChangeNotifier`-based screen state, exposed to the widget
/// tree via `Provider`. Screen notifiers extend this instead of
/// `ChangeNotifier` directly so they have a single place to release any
/// streams/subscriptions they own.
abstract class ScreenNotifier extends ChangeNotifier {
  /// Use this function to dispose the notifier and any other streams
  void closeNotifier();

  @override
  void dispose() {
    closeNotifier();
    super.dispose();
  }
}
