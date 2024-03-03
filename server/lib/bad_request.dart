import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Response badRequest({
  String? hint,
  String? message,
}) {
  return Response.json(
    statusCode: HttpStatus.badRequest,
    body: {
      'hint': hint,
      'message': message,
    },
  );
}
