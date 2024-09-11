import 'dart:async';

import 'package:app/repository/auth_store.dart';
import 'package:app/repository/licensing_store.dart';
import 'package:app/repository/logging_store.dart';
import 'package:app/repository/url_store.dart';
import 'package:app/startup/startup_event.dart';
import 'package:app/startup/startup_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartUpBloc extends Bloc<StartUpEvent, StartUpState> {
  StartUpBloc({
    required UrlStore url,
    required LoggingStore logging,
    required LicensingStore licensing,
    required AuthenticationStore auth,
  })  : _url = url,
        _logging = logging,
        _licensing = licensing,
        _auth = auth,
        super(LoadingStartUpState()) {
    on<InitializeStartUpEvent>(_onInitializeStartUpEvent);
  }

  Future<void> _onInitializeStartUpEvent(
    InitializeStartUpEvent event,
    Emitter<StartUpState> emit,
  ) async {
    LicenseRegistry.addLicense(_licensing.fontLicenses);
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      unawaited(
        _logging.logException(
          exception: details.exception,
          stackTrace: details.stack,
        ),
      );
    };

    try {
      final (u, _) = await (_url.getUrl(), _auth.refresh()).wait;
      if (u == null) _auth.signOut();
    } catch (e, s) {
      unawaited(_logging.logException(exception: e, stackTrace: s));
    } finally {
      emit(ReadyStartUpState());
    }
  }

  final UrlStore _url;
  final LoggingStore _logging;
  final LicensingStore _licensing;
  final AuthenticationStore _auth;
}
