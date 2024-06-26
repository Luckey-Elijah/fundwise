String currencyFormatter({
  required FundwiseCurrencyFormat format,
  required int milliunits,
}) {
  final buff = StringBuffer();
  if (format.symbolFirst) buff.write(format.symbol);

  final chars = '$milliunits'.split('');

  // split at decimal
  final splitIndex = chars.length - 3;
  final wholes = [...chars.take(splitIndex)];

  for (var i = 0; i < wholes.length; i++) {
    final seperate = (i - 1) % format.groupSize == 0;
    if (seperate) buff.write(format.groupSeperator);
    buff.write(wholes[i]);
  }

  final decimals = [...chars.skip(splitIndex)];

  if (format.decimalDigits > 0) buff.write(format.decimalSeperator);

  for (var i = 0; i < format.decimalDigits; i++) {
    if (i > decimals.length) {
      buff.write('0');
    } else {
      buff.write(decimals[i]);
    }
  }

  if (!format.symbolFirst) buff.write(format.symbol);
  return '$buff';
}

class FundwiseCurrencyFormat {
  FundwiseCurrencyFormat({
    required this.decimalDigits,
    required this.groupSize,
    required this.decimalSeperator,
    required this.groupSeperator,
    required this.symbol,
    required this.displaySymbol,
    required this.symbolFirst,
  })  : assert(decimalDigits >= 0, '[decimalDigits] must be non-negative.'),
        assert(groupSize >= 0, '[groupSize] must be non-negative.');

  final int decimalDigits;
  final int groupSize;
  final String decimalSeperator;
  final String groupSeperator;
  final String symbol;
  final bool displaySymbol;
  final bool symbolFirst;
}
