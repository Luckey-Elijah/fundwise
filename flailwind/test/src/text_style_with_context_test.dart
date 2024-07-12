import 'package:flailwind/flailwind.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  group('TextStyleWithContext', () {
    late BuildContext context;
    late TextStyleWithContext style;
    setUp(() {
      context = MockBuildContext();
      style = TextStyleWithContext(context: context, textStyle: null);
    });

    tearDown(() => reset(context));

    test('copyWith({ bool? inherit })', () {
      expect(style.copyWith(inherit: false).inherit, isFalse);
      expect(style.copyWith(inherit: true).inherit, isTrue);
    });

    test('copyWith({ color })', () {}, skip: true);

    test('copyWith({ backgroundColor })', () {}, skip: true);

    test('copyWith({ fontSize })', () {}, skip: true);

    test('copyWith({ fontWeight })', () {}, skip: true);

    test('copyWith({ fontStyle })', () {}, skip: true);

    test('copyWith({ letterSpacing })', () {}, skip: true);

    test('copyWith({ wordSpacing })', () {}, skip: true);

    test('copyWith({ textBaseline })', () {}, skip: true);

    test('copyWith({ height })', () {}, skip: true);

    test('copyWith({ leadingDistribution })', () {}, skip: true);

    test('copyWith({ locale })', () {}, skip: true);

    test('copyWith({ foreground })', () {}, skip: true);

    test('copyWith({ background })', () {}, skip: true);

    test('copyWith({ shadows })', () {}, skip: true);

    test('copyWith({ fontFeatures })', () {}, skip: true);

    test('copyWith({ fontVariations })', () {}, skip: true);

    test('copyWith({ decoration })', () {}, skip: true);

    test('copyWith({ decorationColor })', () {}, skip: true);

    test('copyWith({ decorationStyle })', () {}, skip: true);

    test('copyWith({ decorationThickness })', () {}, skip: true);

    test('copyWith({ debugLabel })', () {}, skip: true);

    test('copyWith({ fontFamily })', () {}, skip: true);

    test('copyWith({ fontFamilyFallback })', () {}, skip: true);

    test('copyWith({ package })', () {}, skip: true);

    test('copyWith({ overflow })', () {}, skip: true);
  });
}
