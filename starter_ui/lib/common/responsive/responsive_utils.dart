import 'package:flutter/material.dart';

/// Generic method to get a different widgets or values based on orientation
T? getValueForOrientation<T>(
  context, {
  T? portrait,
  T? landscape,
}) {
  final orientation = MediaQuery.of(context).orientation;
  if (orientation == Orientation.landscape) return landscape;
  return portrait;
}
