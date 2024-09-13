import 'package:app/account_summaries/account_summaries_event.dart';
import 'package:app/account_summaries/account_summaries_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSummariesBloc
    extends Bloc<AccountSummariesEvent, AccountSummariesState> {
  AccountSummariesBloc() : super(AccountSummariesState(accountGroups: [])) {
    on<AccountSummaryToggleExpand>(_onAccountSummaryToggleExpand);
    on<AccountSummariesInitialize>(_onAccountSummariesInitialize);
  }

  void _onAccountSummaryToggleExpand(
    AccountSummaryToggleExpand event,
    Emitter<AccountSummariesState> emit,
  ) {
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
  }

  void _onAccountSummariesInitialize(
    AccountSummariesInitialize event,
    Emitter<AccountSummariesState> emit,
  ) {
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
  }
}
