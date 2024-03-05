import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:faker/faker.dart';
import 'package:fundwise_core/fundwise_core.dart'; // ignore: depend_on_referenced_packages
import 'package:fundwise_database/database.dart';

final fundwiseDatabase = FundwiseDatabase();

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  await _seedData(fundwiseDatabase);
  Middleware databaseProvider() =>
      provider<FundwiseDatabase>((context) => fundwiseDatabase);

  return serve(handler.use(databaseProvider()), ip, port);
}

bool seeded = false;
Future<void> _seedData(FundwiseDatabase db) async {
  if (seeded) return;
  final fake = Faker();
  final seededId = Value(fake.randomGenerator.integer(99, min: 1));
  final budgetId = seededId;
  stdout.writeln('Seeding with fake data...');
  int randomBalace() => fake.randomGenerator.integer(300000, min: 10000);
  await db.customStatement('PRAGMA foreign_keys = OFF');
  await db.batch(
    (batch) {
      batch
        ..insert(
          db.users,
          UsersCompanion.insert(name: fake.person.name(), id: seededId),
          onConflict: DoNothing<Users, dynamic>(),
        )
        ..insert(
          db.budgets,
          BudgetsCompanion.insert(
            name: fake.vehicle.model(),
            dateFormat: 'mm-dd-yyyy',
            currencyFormat: r'$#,###.##',
            id: seededId,
            userId: seededId,
          ),
          onConflict: DoNothing<Budgets, dynamic>(),
        );

      for (var i = 1; i < fake.randomGenerator.integer(9, min: 2); i++) {
        final accountId = Value(i);
        final name = fake.job.title();
        batch
          ..insert(
            db.payees,
            PayeesCompanion.insert(
              name: name,
              budgetId: budgetId.value,
              id: accountId,
            ),
          )
          ..insert(
            db.accounts,
            AccountsCompanion.insert(
              name: name,
              type: AccountType.values[i % AccountType.values.length],
              balance: randomBalace(),
              clearedBalance: randomBalace(),
              unclearedBalance: randomBalace(),
              budgetId: seededId.value,
              payeeId: accountId.value,
              id: accountId,
            ),
          );
      }
    },
  );

  await db.customStatement('PRAGMA foreign_keys = ON');
  seeded = true;
  stdout.writeln('Seeded with fake data...');
}
