import 'dart:async';
import 'dart:developer';

import 'package:app/repository/logging_store.dart';
import 'package:app/repository/user_model.dart';
import 'package:pocketbase/pocketbase.dart';

export 'package:pocketbase/pocketbase.dart' show AuthStoreEvent;

class AuthenticationStore {
  AuthenticationStore({
    required LoggingStore loggingStore,
    required PocketBase pb,
  })  : _loggingStore = loggingStore,
        _pb = pb;

  final LoggingStore _loggingStore;

  final PocketBase _pb;

  Stream<AuthStoreEvent> get stream => _stream;

  late final _stream = _pb.authStore.onChange.map((e) {
    log('$e', name: '_pb.authStore');
    return e;
  }).asBroadcastStream();

  UserModel? get user {
    final model = _pb.authStore.model;
    if (model is RecordModel) return UserModel.fromJson(model.data);
    return null;
  }

  void signOut() {
    _pb.authStore.clear();
  }

  Future<RecordModel?> refresh() async {
    if (!_pb.authStore.isValid) {
      // no need to attempt [authRefresh]
      signOut();
      return null;
    }

    try {
      final RecordAuth(:record) = await _pb.collection('users').authRefresh();
      return record;
    } on ClientException catch (e, s) {
      if (e.statusCode == 401) {
        signOut();
        return null;
      }
      final error = e.originalError;
      unawaited(_loggingStore.logException(exception: error, stackTrace: s));
      rethrow;
    }
  }

  Future<void> signIn({
    required String usernameOrEmail,
    required String password,
  }) async {
    await _pb.collection('users').authWithPassword(
          usernameOrEmail,
          password,
        );
  }

  Future<void> signUp({
    required String? username,
    required String? email,
    required String password,
    required String confirm,
  }) async {
    if (password != confirm) return;
    await _pb.collection('users').create(
      body: {
        'email': email,
        'username': username,
        'password': password,
        'emailVisibility': true,
        'passwordConfirm': confirm,
      },
    );
  }
}
