import 'package:flutter/material.dart';
import 'package:starter_core/common/extensions/extensions.dart';

abstract class BaseScreen<T> extends StatefulWidget {
  final T param;

  const BaseScreen({required this.param, required Key? key})
      : super(
          key: key,
        );

  static Widget createScreen<T>({
    required T Function() converter,
    required Widget Function(T param) successBuilder,
    Widget Function()? errorBuilder,
  }) {
    try {
      final param = converter();

      return successBuilder(param);
    } catch (e, trace) {
      e.toString().logE;
      trace.toString().logE;

      return errorBuilder?.call() ??
          Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: const Center(
              child: Text('ROUTE ERROR CHECK THE ROUTE GENERATOR'),
            ),
          );
    }
  }
}
