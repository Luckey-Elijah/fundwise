import 'dart:async';

import 'package:app/repository/repository.dart';
import 'package:app/startup/startup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartUpBloc extends Bloc<StartUpEvent, StartUpState> {
  StartUpBloc({
    required UrlRepository url,
    required LoggingRepository logging,
    required LicensingRepository licensing,
    required AuthenticationRepository auth,
  })  : _url = url,
        _logging = logging,
        _licensing = licensing,
        _auth = auth,
        super(LoadingStartUpState()) {
    on<InitializeStartUpEvent>(_onInitializeStartUpEvent);
  }

  final UrlRepository _url;
  final LoggingRepository _logging;
  final LicensingRepository _licensing;
  final AuthenticationRepository _auth;

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
      // Log everything else
      // ignore: avoid_catches_without_on_clauses
    } catch (e, s) {
      unawaited(_logging.logException(exception: e, stackTrace: s));
    } finally {
      final duration = event.duration;
      if (duration != null) await Future<void>.delayed(duration);
      emit(ReadyStartUpState());
    }
  }
}
