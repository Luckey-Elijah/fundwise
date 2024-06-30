import 'package:app/repository/currency_format.model.dart';
import 'package:app/util.dart';

class BudgetSummaryModel {
  const BudgetSummaryModel({
    required this.id,
    required this.name,
    required this.dateFormat,
    required this.owner,
    required this.currencyFormat,
  });

  factory BudgetSummaryModel.fromJson(Map<String, dynamic> map) {
    return BudgetSummaryModel(
      id: map.tryString('id') ?? '',
      name: map.tryString('name') ?? '',
      dateFormat: map.tryString('date_format') ?? '',
      owner: map.tryString('owner') ?? '',
      currencyFormat: CurrencyFormatModel.fromJson(
        map.tryMap('currency_format') ?? {},
      ),
    );
  }

  final String id;
  final String name;
  final String dateFormat;
  final String owner;
  final CurrencyFormatModel currencyFormat;
}
