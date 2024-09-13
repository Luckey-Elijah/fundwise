import 'package:dart_mappable/dart_mappable.dart';

part 'account_summaries_state.mapper.dart';

@MappableClass()
class AccountSummariesState with AccountSummariesStateMappable {
  AccountSummariesState({required this.accountGroups});

  final List<AccountGroupSummary> accountGroups;
}

@MappableClass()
class AccountSummary with AccountSummaryMappable {
  AccountSummary({
    required this.label,
    required this.balance,
    this.negative = false,
    this.actions = const <int>{},
  });

  final String label;
  final String balance;
  final bool negative;
  final Set<int> actions;
}

@MappableClass()
class AccountGroupSummary with AccountGroupSummaryMappable {
  AccountGroupSummary({
    required this.label,
    required this.balance,
    required this.accounts,
    this.expanded = false,
    this.negative = false,
  });

  final String label;
  final String balance;
  final bool expanded;
  final bool negative;

  final List<AccountSummary> accounts;
}
