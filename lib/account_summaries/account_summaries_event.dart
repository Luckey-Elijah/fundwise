abstract class AccountSummariesEvent {}

class AccountSummariesInitialize extends AccountSummariesEvent {}

class AccountSummaryToggleExpand extends AccountSummariesEvent {
  AccountSummaryToggleExpand(this.index);
  final int index;
}
