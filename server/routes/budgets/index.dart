import 'dart:async';

import 'package:dart_frog/dart_frog.dart';
import 'package:fundwise_database/database.dart';
import 'package:fundwise_server/bad_request.dart';
import 'package:fundwise_server/server.dart';

FutureOr<Response> onRequest(RequestContext context) {
  return requestHandler(
    context,
    onPost: _onPost(),
    onGet: _onGet(),
  );
}

HandleRequest _onGet() {
  return (context) async => Response.json(
        body: await context.database.select(context.database.budgets).get(),
      );
}

HandleRequest _onPost() {
  return (context) async {
    final db = context.database;

    final json = await context.request.json();
    if (json
        case {
          'currencyFormat': final String currencyFormat,
          'dateFormat': final String dateFormat,
          'name': final String name,
        }) {
      final budget = await db.into(db.budgets).insertReturning(
            BudgetsCompanion.insert(
              currencyFormat: currencyFormat,
              dateFormat: dateFormat,
              name: name,
            ),
          );

      return Response.json(
        body: {
          'budget': budget,
          'budgets': await db.select(db.budgets).get(),
        },
      );
    }

    return badRequest();
  };
}
