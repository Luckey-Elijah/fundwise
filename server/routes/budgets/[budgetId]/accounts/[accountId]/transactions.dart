import 'package:collection/collection.dart';
import 'package:dart_frog/dart_frog.dart';
// ignore: depend_on_referenced_packages
import 'package:fundwise_core/fundwise_core.dart';
import 'package:fundwise_database/database.dart';
import 'package:fundwise_server/bad_request.dart';
import 'package:fundwise_server/request_context_extension.dart';
import 'package:fundwise_server/request_handler.dart';

Future<Response> onRequest(
  RequestContext context,
  String budgetId,
  String accountId,
) async {
  final parsedBudget = int.tryParse(budgetId);
  final parsedAccount = int.tryParse(accountId);
  if (parsedBudget == null) {
    return badRequest(message: '[budgetId] is not a valid id.');
  }

  if (parsedAccount == null) {
    return badRequest(message: '[accountId] is not a valid id.');
  }
  return requestHandler(
    context,
    onPost: (context) async {
      final json = await context.request.json();
      if (json
          case {
            'amount': final int? amount,
            'note': final String? note,
            'status': final String? status,
            'flagName': final String? flagName,
            'flagColor': final String? flagColor,
            'payeeId': final int? payeeId,
            'categoryId': final int? categoryId,
          }) {
        final transaction = await context.database
            .into(context.database.transactions)
            .insertReturning(
              TransactionsCompanion.insert(
                status: TransactionStatus.values.firstWhereOrNull(
                      (element) => element.name == status,
                    ) ??
                    TransactionStatus.uncleared,
                approved: true,
                budgetId: parsedBudget,
                accountId: Value(parsedAccount),
                amount: Value(amount),
                categoryId: Value(categoryId),
                payeeId: Value(payeeId),
                flagColor: Value(flagColor),
                flagName: Value(flagName),
                note: Value(note),
              ),
            );
        return Response.json(body: transaction);
      }
      return badRequest();
    },
    onGet: (context) async {
      return Response.json(
        body: {
          'transactions': await context.database
              .getTransactions(parsedBudget, parsedAccount),
        },
      );
    },
  );
}
