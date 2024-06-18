import 'dart:async';

import 'package:app/components/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';

abstract class AccountEvent {}

class InitilaizeAccountEvent extends AccountEvent {}

class AccountState {
  const AccountState({
    required this.status,
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.verified,
  });

  const AccountState.empty(this.status)
      : id = null,
        username = null,
        email = null,
        name = null,
        verified = null;

  static const initial = AccountState.empty(FundwiseStatus.initial);

  final FundwiseStatus status;
  final bool? verified;
  final String? id;
  final String? username;
  final String? email;
  final String? name;
}

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc(this.pb) : super(AccountState.initial) {
    on<InitilaizeAccountEvent>(_onInitilaizeAccountEvent);
  }

  final PocketBase pb;

  FutureOr<void> _onInitilaizeAccountEvent(
    InitilaizeAccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(const AccountState.empty(FundwiseStatus.loading));
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
        AccountState(
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
