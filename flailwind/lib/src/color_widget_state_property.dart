// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

extension WidgetStatePropertyColorNullable on Color? {
  WidgetStateProperty<Color?> get all => WidgetStatePropertyAll(this);
}

extension WidgetStatePropertyColor on Color {
  WidgetStateProperty<Color> get all => WidgetStatePropertyAll(this);
}
