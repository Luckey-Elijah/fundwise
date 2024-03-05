import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Response badRequest({
  String? hint,
  String? message,
  Object? error,
  StackTrace? stackTrace,
  int statusCode = HttpStatus.badRequest,
}) {
  return Response.json(
    body: {
      if (hint != null) ...{'hint': hint},
      if (message != null) ...{'message': message},
      if (error != null) ...{'error': error},
      if (stackTrace != null) ...{'stackTrace': stackTrace},
    },
  );
}
