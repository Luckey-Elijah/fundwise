import 'package:flailwind/src/color_widget_state_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WidgetStatePropertyColor<T extends Color?>', () {
    test('Color? is null', () {
      Color? color;
      final property = color.all;
      expect(property, isA<WidgetStatePropertyAll<Color?>>());
      expect(
        (property as WidgetStatePropertyAll<Color?>).value,
        equals(null),
      );
    });

    test('Color? is not null', () {
      const color = Color(0x00000000);
      final property = color.all;
      expect(property, isA<WidgetStatePropertyAll<Color>>());
      expect(
        (property as WidgetStatePropertyAll<Color>).value,
        equals(const Color(0x00000000)),
      );
    });
  });
}
