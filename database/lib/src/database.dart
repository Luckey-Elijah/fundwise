import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fundwise_core/fundwise_core.dart';

part 'database.g.dart';
part 'tables.dart';

@DriftDatabase(
  tables: [
    Users,
    Budgets,
    Accounts,
    Categories,
    Payees,
    Transactions,
    Flags,
  ],
)
class FundwiseDatabase extends _$FundwiseDatabase {
  FundwiseDatabase()
      : super(
          LazyDatabase(
            NativeDatabase.memory, // for development
// () => NativeDatabase.createInBackground(File('fundwise-db.sqlite')),
          ),
        );

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        // https://drift.simonbinder.eu/docs/getting-started/advanced_dart_tables/#references
        beforeOpen: (_) => customStatement('PRAGMA foreign_keys = ON'),
      );
}
