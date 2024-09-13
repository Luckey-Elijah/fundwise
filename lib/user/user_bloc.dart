import 'dart:async';

import 'package:app/components/status.dart';
import 'package:app/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UserEvent {}

class InitializeUserEvent extends UserEvent {}

class UserState {
  const UserState({
    required this.status,
    required this.user,
  });

  const UserState.empty(this.status) : user = null;

  static const initial = UserState.empty(FundwiseStatus.initial);

  final FundwiseStatus status;
  final UserModel? user;
}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.userRepository}) : super(UserState.initial) {
    on<InitializeUserEvent>(_onInitializeUserEvent);
  }

  final UserRepository userRepository;

  FutureOr<void> _onInitializeUserEvent(
    InitializeUserEvent event,
    Emitter<UserState> emit,
  ) async {
    final user = userRepository.user;
    emit(
      UserState(
        status: FundwiseStatus.loaded,
        user: user,
      ),
    );
  }
}
