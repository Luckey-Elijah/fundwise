import 'package:app/util.dart';

class BudgetSummaryModel {
  const BudgetSummaryModel({
    required this.id,
    required this.name,
    required this.dateFormat,
    required this.currencyExample,
    required this.owner,
  });

  factory BudgetSummaryModel.fromJson(Map<String, dynamic> map) {
    return BudgetSummaryModel(
      id: map.tryString('id') ?? '',
      name: map.tryString('name') ?? '',
      dateFormat: map.tryString('date_format') ?? '',
      currencyExample: map.tryString('currency_example') ?? '',
      owner: map.tryString('owner') ?? '',
    );
  }

  final String id;
  final String name;
  final String dateFormat;
  final String currencyExample;
  final String owner;
}
