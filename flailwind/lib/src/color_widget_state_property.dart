import 'package:flutter/material.dart';

/// A property that can be used to set a color for a widget.
extension WidgetStatePropertyColor<T extends Color?> on T {
  /// Helper ot set all the states of a widget.
  WidgetStateProperty<T> get all => WidgetStatePropertyAll(this);
}
