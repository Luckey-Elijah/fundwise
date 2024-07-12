import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  group('TextStyleWithContext.copyWith', () {
    late BuildContext context;

    setUp(() => context = MockBuildContext());

    tearDown(() => reset(context));

    test('bool? inherit', () {});
    test('Color? color', () {});
    test('Color? backgroundColor', () {});
    test('double? fontSize', () {});
    test('FontWeight? fontWeight', () {});
    test('FontStyle? fontStyle', () {});
    test('double? letterSpacing', () {});
    test('double? wordSpacing', () {});
    test('TextBaseline? textBaseline', () {});
    test('double? height', () {});
    test('TextLeadingDistribution? leadingDistribution', () {});
    test('Locale? locale', () {});
    test('Paint? foreground', () {});
    test('Paint? background', () {});
    test('List<Shadow>? shadows', () {});
    test('List<FontFeature>? fontFeatures', () {});
    test('List<FontVariation>? fontVariations', () {});
    test('TextDecoration? decoration', () {});
    test('Color? decorationColor', () {});
    test('TextDecorationStyle? decorationStyle', () {});
    test('double? decorationThickness', () {});
    test('String? debugLabel', () {});
    test('String? fontFamily', () {});
    test('List<String>? fontFamilyFallback', () {});
    test('String? package', () {});
    test('TextOverflow? overflow', () {});
  });
}
