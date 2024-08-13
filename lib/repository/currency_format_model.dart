import 'package:app/util.dart';

class CurrencyFormatModel {
  CurrencyFormatModel({
    required this.decimalDigits,
    required this.groupSize,
    required this.decimalSeparator,
    required this.groupSeparator,
    required this.symbol,
    required this.displaySymbol,
    required this.symbolFirst,
    this.negativeSymbol = '-',
    this.negativeSymbolFirst = true,
  })  : assert(decimalDigits >= 0, '[decimalDigits] must be non-negative.'),
        assert(groupSize >= 0, '[groupSize] must be non-negative.');

  factory CurrencyFormatModel.fromJson(Map<String, dynamic> map) {
    return CurrencyFormatModel(
      decimalDigits: map.tryInt('decimal_digits') ?? 0,
      groupSize: map.tryInt('group_size') ?? 0,
      decimalSeparator: map.tryString('decimal_separator') ?? '',
      groupSeparator: map.tryString('group_separator') ?? '',
      symbol: map.tryString('symbol') ?? '',
      displaySymbol: map.tryBool('display_symbol') ?? true,
      symbolFirst: map.tryBool('symbol_first') ?? true,
    );
  }

  final int decimalDigits;
  final int groupSize;
  final String decimalSeparator;
  final String groupSeparator;
  final String symbol;
  final String negativeSymbol;
  final bool displaySymbol;
  final bool symbolFirst;
  final bool negativeSymbolFirst;
}
