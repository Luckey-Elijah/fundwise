import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:fundwise_database/database.dart';
import 'package:fundwise_server/bad_request.dart';
import 'package:fundwise_server/request_context_extension.dart';
import 'package:fundwise_server/request_handler.dart';

Future<Response> onRequest(
  RequestContext context,
  String budgetId,
) async {
  return await requestHandler(
    context,
    onGet: (context) async {
      final id = int.tryParse(budgetId);
      return switch (id) {
        == null => badRequest(
            hint: '[budgetId] is not a valid id.',
            statusCode: HttpStatus.notFound,
          ),
        _ => Response.json(
            body: {'accounts': await context.database.getAccounts(id)},
          )
      };
    },
  );
}
