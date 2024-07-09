import 'dart:math';

import 'package:app/repository/currency_format_model.dart';

String currencyFormatter({
  required CurrencyFormatModel format,
  required int milliunits,
}) {
  final buff = StringBuffer();

  if (milliunits < 0) {
    milliunits = milliunits * -1;
    buff.write('-');
  }

  if (format.symbolFirst) buff.write(format.symbol);

  final chars = '$milliunits'.padLeft(4, '0').split('');

  // split at decimal
  final splitIndex = max(chars.length - 3, 0);
  final wholes = [...chars.take(splitIndex)];

  for (var i = 0; i < wholes.length; i++) {
    final j = wholes.length - i;
    final separate = (j % format.groupSize) == 0;
    if (j < wholes.length && separate) buff.write(format.groupSeparator);
    buff.write(wholes[i]);
  }

  final decimals = [...chars.skip(splitIndex)];

  if (format.decimalDigits > 0) buff.write(format.decimalSeparator);

  for (var i = 0; i < min(format.decimalDigits, decimals.length); i++) {
    if (i > decimals.length) {
      buff.write('0');
    } else {
      buff.write(decimals[i]);
    }
  }

  if (!format.symbolFirst) buff.write(format.symbol);
  return '$buff';
}
