import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_summaries_bloc.mapper.dart';

abstract class AccountSummariesEvent {}

class AccountSummariesInitialize extends AccountSummariesEvent {}

class AccountSummaryToggleExpand extends AccountSummariesEvent {
  AccountSummaryToggleExpand(this.index);
  final int index;
}

class AccountSummariesBloc
    extends Bloc<AccountSummariesEvent, AccountSummariesState> {
  AccountSummariesBloc() : super(AccountSummariesState(accountGroups: [])) {
    on<AccountSummaryToggleExpand>((event, emit) {
      emit(
        state.copyWith(
          accountGroups: [
            for (var i = 0; i < state.accountGroups.length; i++) ...[
              if (i == event.index)
                state.accountGroups[i].copyWith(
                  expanded: !state.accountGroups[i].expanded,
                ),
              if (i != event.index) state.accountGroups[i],
            ],
          ],
        ),
      );
    });
    on<AccountSummariesInitialize>((event, emit) {
      emit(
        state.copyWith(
          accountGroups: [
            AccountGroupSummary(
              accounts: [
                AccountSummary(
                  label: 'Credit Card',
                  balance: r'-$733.90',
                  negative: true,
                  actions: {0},
                ),
                AccountSummary(
                  label: 'Checking',
                  balance: r'$2,133.01',
                  actions: {1},
                ),
                AccountSummary(
                  label: 'Checking',
                  balance: r'$6,281.19',
                  actions: {},
                ),
              ],
              label: 'budget',
              balance: r'$12.721.98',
              expanded: true,
            ),
            AccountGroupSummary(
              accounts: [
                AccountSummary(
                  label: 'Mortgage',
                  balance: r'-$292,890.32',
                  negative: true,
                  actions: {},
                ),
              ],
              label: 'loan',
              balance: r'-$292,890.80',
              expanded: true,
              negative: true,
            ),
            AccountGroupSummary(
              accounts: [
                AccountSummary(
                  label: '401(k) Guideline',
                  balance: r'$87,908.76',
                  actions: {},
                ),
                AccountSummary(
                  label: '401k Fidelity',
                  balance: r'$9,725.09',
                  actions: {},
                ),
              ],
              label: 'tracking',
              balance: r'$400,098.32',
              expanded: true,
            ),
          ],
        ),
      );
    });
  }
}

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
