import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return Response.json(
    body: [
      {
        'path': '/',
        'description': '',
      },
      {
        'path': '/user',
        'description': '',
      },
      {
        'path': '/budgets',
        'description': '',
      },
      {
        'path': '/budgets/[budgetId]',
        'description': '',
      },
      {
        'path': '/budgets/[budgetId]/accounts',
        'description': '',
      },
      {
        'path': '/budgets/[budgetId]/accounts/[accountId]',
        'description': '',
      },
      {
        'path': '/budgets/[budgetId]/categories',
        'description': '',
      },
      {
        'path': '/budgets/[budgetId]/categories/[categoryId]',
        'description': '',
      },
      {
        'path': '/budgets/[budgetId]/categories/[categoryId]/transactions',
        'description': '',
      },
      {
        'path': '/budgets/[budgetId]/payees',
        'description': '',
      },
      {
        'path': '/budgets/[budgetId]/payees/[payeeId]',
        'description': '',
      },
      {
        'path': '/budgets/[budgetId]/payees/[payeeId]/transactions',
        'description': '',
      },
      {
        'path': '/budgets/[budgetId]/settings',
        'description': '',
      },
      {
        'path': '/budgets/[budgetId]/transactions',
        'description': '',
      },
      {
        'path': '/budgets/[budgetId]/transactions/[transactionId]',
        'description': '',
      },
    ],
  );
}
