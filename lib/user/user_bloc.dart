import 'dart:async';

import 'package:app/components/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';

abstract class UserEvent {}

class InitilaizeUserEvent extends UserEvent {}

class UserState {
  const UserState({
    required this.status,
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.verified,
  });

  const UserState.empty(this.status)
      : id = null,
        username = null,
        email = null,
        name = null,
        verified = null;

  static const initial = UserState.empty(FundwiseStatus.initial);

  final FundwiseStatus status;
  final bool? verified;
  final String? id;
  final String? username;
  final String? email;
  final String? name;
}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.pb) : super(UserState.initial) {
    on<InitilaizeUserEvent>(_onInitilaizeUserEvent);
  }

  final PocketBase pb;

  FutureOr<void> _onInitilaizeUserEvent(
    InitilaizeUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.empty(FundwiseStatus.loading));
    final authModel = pb.authStore.model;
    final id = switch (pb.authStore.model) {
      final RecordModel record => record.id,
      final AdminModel admin => admin.id,
      _ => null,
    };

    if (id == null) return;

    if (authModel is RecordModel) {
      final username = authModel.getStringValue('username');
      final email = authModel.getStringValue('email');
      final name = authModel.getStringValue('name');
      final verified = authModel.getBoolValue('verified');
      emit(
        UserState(
          status: FundwiseStatus.loaded,
          id: id,
          username: username,
          email: email,
          name: name,
          verified: verified,
        ),
      );
    }
  }
}
