import 'package:app/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('currencyFormatter', () {
    expect(
      currencyFormatter(
        milliunits: 10000,
        format: CurrencyFormatModel(
          decimalSeparator: '.',
          groupSeparator: ',',
          symbol: r'$',
          groupSize: 3,
          decimalDigits: 2,
          displaySymbol: true,
          symbolFirst: true,
        ),
      ),
      equals(r'$10.00'),
    );

    expect(
      currencyFormatter(
        milliunits: -10000,
        format: CurrencyFormatModel(
          decimalSeparator: '.',
          groupSeparator: ',',
          symbol: r'$',
          groupSize: 3,
          decimalDigits: 2,
          displaySymbol: true,
          symbolFirst: true,
        ),
      ),
      equals(r'-$10.00'),
    );

    expect(
      currencyFormatter(
        milliunits: 0,
        format: CurrencyFormatModel(
          decimalSeparator: '.',
          groupSeparator: ',',
          symbol: r'$',
          groupSize: 3,
          decimalDigits: 2,
          displaySymbol: true,
          symbolFirst: true,
        ),
      ),
      equals(r'$0.00'),
    );

    expect(
      currencyFormatter(
        milliunits: -0,
        format: CurrencyFormatModel(
          decimalSeparator: '.',
          groupSeparator: ',',
          symbol: r'$',
          groupSize: 3,
          decimalDigits: 2,
          displaySymbol: true,
          symbolFirst: true,
        ),
      ),
      equals(r'$0.00'),
    );

    expect(
      currencyFormatter(
        milliunits: 1000000,
        format: CurrencyFormatModel(
          decimalSeparator: '.',
          groupSeparator: ',',
          symbol: r'$',
          groupSize: 3,
          decimalDigits: 2,
          displaySymbol: true,
          symbolFirst: true,
        ),
      ),
      equals(r'$1,000.00'),
    );

    expect(
      currencyFormatter(
        milliunits: 1000001,
        format: CurrencyFormatModel(
          decimalSeparator: '.',
          groupSeparator: ',',
          symbol: r'$',
          groupSize: 3,
          decimalDigits: 2,
          displaySymbol: true,
          symbolFirst: true,
        ),
      ),
      equals(r'$1,000.00'),
    );
  });
}
