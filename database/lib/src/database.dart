import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fundwise_core/fundwise_core.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Budgets, Accounts, Categories, Payees, Transactions, Flags],
)
class FundwiseDatabase extends _$FundwiseDatabase {
  FundwiseDatabase()
      : super(
          LazyDatabase(
            () => NativeDatabase.createInBackground(File('fundwise-db.sqlite')),
          ),
        );

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (_) => customStatement('PRAGMA foreign_keys = ON'),
      );

  Future<Budget?> getBudget(int? id) =>
      (select(budgets)..where((table) => table.id.equalsNullable(id)))
          .getSingleOrNull();

  Future<List<Budget>> getBudgets() => select(budgets).get();

  Future<Account?> getAccount(int? id) =>
      (select(accounts)..where((table) => table.id.equalsNullable(id)))
          .getSingleOrNull();

  Future<List<Account>> getAccounts(int? budgetId) => (select(accounts)
        ..where((table) => table.budgetId.equalsNullable(budgetId)))
      .get();

  Future<Category?> getCategory(int? id) =>
      (select(categories)..where((table) => table.id.equalsNullable(id)))
          .getSingleOrNull();

  Future<List<Category>> getCategories(int? budgetId) => (select(categories)
        ..where((table) => table.budgetId.equalsNullable(budgetId)))
      .get();

  Future<Payee?> getPayee(int? id) =>
      (select(payees)..where((table) => table.id.equalsNullable(id)))
          .getSingleOrNull();

  Future<List<Payee>> getPayees(int? budgetId) => (select(payees)
        ..where((table) => table.budgetId.equalsNullable(budgetId)))
      .get();

  Future<Transaction?> getTransaction(int? id) =>
      (select(transactions)..where((table) => table.id.equalsNullable(id)))
          .getSingleOrNull();

  Future<List<Transaction>> getTransactions(int? budgetId, int? accountId) {
    var statement = select(transactions)
      ..where((table) => table.budgetId.equalsNullable(budgetId));

    if (accountId != null) {
      statement = statement
        ..where((table) => table.accountId.equals(accountId));
    }
    return statement.get();
  }

  Future<Flag?> getFlag(int? id) =>
      (select(flags)..where((table) => table.id.equalsNullable(id)))
          .getSingleOrNull();

  Future<List<Flag>> getFlags(int? budgetId) =>
      (select(flags)..where((table) => table.budgetId.equalsNullable(budgetId)))
          .get();
}

class Budgets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get dateFormat => text()();
  TextColumn get currencyFormat => text()();
}

class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get type => textEnum<AccountType>()();
  IntColumn get balance => integer()();
  IntColumn get clearedBalance => integer()();
  IntColumn get unclearedBalance => integer()();
  IntColumn get budgetId => integer().references(Budgets, #id)();
  IntColumn get payeeId => integer().references(Payees, #id)();
}

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get hidden => boolean()();
  TextColumn get note => text().nullable()();
  IntColumn get budgeted => integer()();
  IntColumn get activity => integer()();
  IntColumn get balance => integer()();
  IntColumn get budgetId => integer().references(Budgets, #id)();
}

class Payees extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get next => text()();
  IntColumn get budgetId => integer().references(Budgets, #id)();
}

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().nullable()();
  IntColumn get amount => integer().nullable()();
  TextColumn get note => text().nullable()();
  TextColumn get status => textEnum<TransactionStatus>()();
  BoolColumn get approved => boolean()();
  TextColumn get flagName => text().nullable().references(Flags, #name)();
  TextColumn get flagColor => text().nullable().references(Flags, #color)();
  IntColumn get budgetId => integer().references(Budgets, #id)();
  IntColumn get accountId => integer().nullable().references(Accounts, #id)();
  IntColumn get payeeId => integer().nullable().references(Payees, #id)();
  IntColumn get categoryId =>
      integer().nullable().references(Categories, #id)();
}

class Flags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get color => text()();
  TextColumn get note => text().nullable()();
  IntColumn get budgetId => integer().references(Budgets, #id)();
}
