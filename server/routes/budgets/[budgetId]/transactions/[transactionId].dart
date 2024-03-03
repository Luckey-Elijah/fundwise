import 'package:dart_frog/dart_frog.dart';

Response onRequest(
  RequestContext context,
  String budgetId,
  String transactionId,
) {
  return Response(body: 'This is a new route!');
}
