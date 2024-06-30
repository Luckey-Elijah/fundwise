class UsersAuth {
  UsersAuth({
    required this.name,
    required this.avatar,
  });
  final String name;
  final String avatar;
}

class BudgetAccountsBase {
  BudgetAccountsBase({
    required this.name,
    required this.accountType,
    required this.onBudget,
    required this.closed,
    required this.clearedBalance,
    required this.unclearedBalance,
    required this.budget,
  });
  final String name;
  final String accountType;
  final bool onBudget;
  final bool closed;
  final num clearedBalance;
  final num unclearedBalance;
  final String budget;
}

class BudgetsBase {
  BudgetsBase({
    required this.name,
    required this.dateFormat,
    required this.currencyFormat,
    required this.owner,
  });
  final String name;
  final String dateFormat;
  final String currencyFormat;
  final String owner;
}

class CurrencyFormatsBase {
  CurrencyFormatsBase({
    required this.example,
    required this.decimalDigits,
    required this.decimalSeparator,
    required this.groupSeparator,
    required this.symbol,
    required this.groupSize,
    required this.displaySymbol,
    required this.symbolFirst,
  });
  final String example;
  final num decimalDigits;
  final String decimalSeparator;
  final String groupSeparator;
  final String symbol;
  final num groupSize;
  final bool displaySymbol;
  final bool symbolFirst;
}

class DateFormatsBase {
  DateFormatsBase({
    required this.description,
    required this.format,
  });
  final String description;
  final String format;
}

class DefaultBudgetsBase {
  DefaultBudgetsBase({
    required this.budget,
    required this.user,
  });
  final String budget;
  final String user;
}

class ErrorsBase {
  ErrorsBase({
    required this.reporter,
    required this.error,
    required this.stack,
    required this.debug,
  });
  final String reporter;
  final String error;
  final String stack;
  final bool debug;
}

class BudgetsView {
  BudgetsView({
    required this.name,
    required this.dateFormat,
    required this.owner,
    required this.currencyFormat,
  });
  final String name;
  final String dateFormat;
  final String owner;
  final dynamic currencyFormat;
}

class DefaultBudgetsView {
  DefaultBudgetsView({
    required this.name,
    required this.dateFormat,
    required this.owner,
    required this.currencyFormat,
  });
  final String name;
  final String dateFormat;
  final String owner;
  final dynamic currencyFormat;
}
