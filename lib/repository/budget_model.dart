import 'package:app/repository/currency_format_model.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'budget_model.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class BudgetSummaryModel with BudgetSummaryModelMappable {
  const BudgetSummaryModel({
    required this.id,
    required this.name,
    required this.dateFormat,
    required this.owner,
    required this.currencyFormat,
  });

  final String id;
  final String name;
  final String dateFormat;
  final String owner;
  final CurrencyFormatModel currencyFormat;
}
