import 'package:dart_mappable/dart_mappable.dart';

part 'currency_format_model.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class CurrencyFormatModel with CurrencyFormatModelMappable {
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
  });

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
