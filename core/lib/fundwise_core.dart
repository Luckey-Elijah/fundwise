/// {@template account_type}
/// Core account type that can be budgeted.
/// {@endtemplate}
enum AccountType {
  /// {@macro account_type}
  cash,

  /// {@macro account_type}
  savings,

  /// {@macro account_type}
  checking,

  /// {@macro account_type}
  creditCard,

  /// {@macro account_type}
  lineOfCredit,
  ;
}

/// {@template transaction_status}
/// Status of the transaction
/// {@endtemplate}
/// {@macro transaction_status}
enum TransactionStatus {
  /// {@macro transaction_status}
  cleared,

  /// {@macro transaction_status}
  uncleared,

  /// {@macro transaction_status}
  reconciled,
  ;
}
