import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:fundwise_server/request_context_extension.dart';
import 'package:fundwise_server/request_handler.dart';

FutureOr<Response> onRequest(
  RequestContext context,
  String id,
) {
  return requestHandler(
    context,
    onGet: _onGet(id),
    onDelete: _onDelete(id),
  );
}

HandleRequest _onGet(String id) {
  return (context) async {
    final budget = await (context.database.select(context.database.budgets)
          ..where(
            (table) => table.id.equalsNullable(int.tryParse(id)),
          ))
        .getSingleOrNull();
    if (budget == null) {
      return Response.json(
        statusCode: HttpStatus.notFound,
        body: {
          'budgets': null,
        },
      );
    }
    return Response.json(body: budget);
  };
}

HandleRequest _onDelete(String id) {
  return (context) async {
    final budgets = await (context.database.delete(context.database.budgets)
          ..where(
            (table) => table.id.equalsNullable(int.tryParse(id)),
          ))
        .goAndReturn();
    return Response.json(body: {'budgets': budgets});
  };
}
