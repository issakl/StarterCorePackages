import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';

/// Extension on [String] to make printing beautiful debugging prints easier
extension LoggerExtension on String {
  void get logE => GetIt.I<Logger>().e(this);

  void get logW => GetIt.I<Logger>().w(this);

  void get logI => GetIt.I<Logger>().i(this);

  void get logD => GetIt.I<Logger>().d(this);
}
