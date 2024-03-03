import 'package:dart_frog/dart_frog.dart';

Response onRequest(
  RequestContext context,
  String budgetId,
  String accountId,
) {
  return Response(body: 'This is a new route!');
}
