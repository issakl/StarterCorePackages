import 'package:starter_ui/ui_runtime.dart';
import 'package:flutter/material.dart';

void showGuestDialog() {
  showDialog(
    context: UiRuntime.appContext!,
    builder: (context) {
      return const SimpleDialog(
        titlePadding: EdgeInsets.all(24),
        title: Text("Sorry, you are a guest, login to continue."),
      );
    },
  );
}
