import 'package:app/util.dart';

class BudgetModel {
  const BudgetModel({
    required this.id,
    required this.name,
    required this.dateFormat,
    required this.currencyFormat,
    required this.owner,
  });

  factory BudgetModel.fromJson(Map<String, dynamic> map) {
    return BudgetModel(
      id: map.tryString('id') ?? '',
      name: map.tryString('name') ?? '',
      dateFormat: map.tryString('dateFormat') ?? '',
      currencyFormat: map.tryString('currencyFormat') ?? '',
      owner: map.tryString('owner') ?? '',
    );
  }

  final String id;
  final String name;
  final String dateFormat;
  final String currencyFormat;
  final String owner;
}
