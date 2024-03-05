import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:fundwise_server/bad_request.dart';

typedef HandleRequest = FutureOr<Response> Function(RequestContext context);

Future<Response> requestHandler(
  RequestContext context, {
  int version = 1,
  HandleRequest? onDelete,
  HandleRequest? onGet,
  HandleRequest? onHead,
  HandleRequest? onOptions,
  HandleRequest? onPatch,
  HandleRequest? onPost,
  HandleRequest? onPut,
}) async {
  bool httpMethodIsProvided(HttpMethod method) => switch (method) {
        HttpMethod.delete => onDelete != null,
        HttpMethod.get => onGet != null,
        HttpMethod.head => onHead != null,
        HttpMethod.options => onOptions != null,
        HttpMethod.patch => onPatch != null,
        HttpMethod.post => onPost != null,
        HttpMethod.put => onPut != null,
      };

  final allowMethods = HttpMethod.values
      .where(httpMethodIsProvided)
      .map((e) => e.value)
      .join(', ');

  try {
    final response = await switch (context.request.method) {
      HttpMethod.delete when onDelete != null => onDelete(context),
      HttpMethod.get when onGet != null => onGet(context),
      HttpMethod.head when onHead != null => onHead(context),
      HttpMethod.options when onOptions != null => onOptions(context),
      HttpMethod.patch when onPatch != null => onPatch(context),
      HttpMethod.post when onPost != null => onPost(context),
      HttpMethod.put when onPut != null => onPut(context),
      _ => Response(statusCode: HttpStatus.methodNotAllowed),
    };
    return response.copyWith(
      headers: {
        HttpHeaders.accessControlAllowMethodsHeader: allowMethods,
        ...response.headers,
      },
    );
  } on FormatException catch (e) {
    return badRequest(
      message: e.message,
      hint: 'Incorrectly formatted request: ${e.source}',
    );
  } catch (e, s) {
    Zone.current.errorCallback(e, s);
    return badRequest(
      error: e,
      stackTrace: s,
    );
  }
}
