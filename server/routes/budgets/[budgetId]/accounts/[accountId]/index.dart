import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:fundwise_database/database.dart';
import 'package:fundwise_server/bad_request.dart';
import 'package:fundwise_server/request_context_extension.dart';
import 'package:fundwise_server/request_handler.dart';

Future<Response> onRequest(
  RequestContext context,
  String budgetId,
  String accountId,
) async {
  return requestHandler(
    context,
    onGet: (context) async {
      final parsedBudgetId = int.tryParse(budgetId);
      final parsedAccountId = int.tryParse(accountId);

      if (parsedBudgetId == null) {
        return badRequest(
          message: '[budgetId] is not a valid id.',
          statusCode: HttpStatus.notFound,
        );
      }

      if (parsedAccountId == null) {
        return badRequest(
          message: '[accountId] is not a valid id.',
          statusCode: HttpStatus.notFound,
        );
      }

      return Response.json(
        body: await context.database.getAccount(parsedAccountId),
      );
    },
  );
}
