import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:starter_localization/l10n.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassicFooter(
      loadingText: "",
      noDataText: CoreS.current.noDataRefresher,
      failedText: CoreS.current.failedRefresher,
      idleText: "",
      canLoadingText: "",
    );
  }
}
