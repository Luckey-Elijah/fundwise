import 'dart:async';

import 'package:app/components/status.dart';
import 'package:app/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

extension ValidUrl on Uri? {
  bool get valid {
    final url = this;
    if (url == null) return false;
    return url.isScheme('HTTP') || url.isScheme('HTTPS');
  }
}

class ServerCubit extends Cubit<ServerState> {
  ServerCubit({
    required UrlRepository url,
    required HealthRepository health,
  })  : _url = url,
        _health = health,
        super(
          const ServerState(
            healthy: null,
            url: null,
            status: FundwiseStatus.initial,
          ),
        );

  final UrlRepository _url;
  final HealthRepository _health;
  Future<void> initialize() async {
    emit(state.copyWith(status: FundwiseStatus.loading));
    final url = await _url.getUrl();
    emit(
      state.copyWith(
        url: () => url,
        status: FundwiseStatus.loaded,
      ),
    );

    await check();
  }

  Future<void> updateUrl(String text) async {
    emit(state.copyWith(status: FundwiseStatus.loading));

    final url = Uri.tryParse(text);
    if (state.url == url) {
      return emit(state.copyWith(status: FundwiseStatus.loaded));
    }

    if (url.valid) {
      await _url.setUrl(url);
      emit(
        state.copyWith(
          url: () => url,
          status: FundwiseStatus.loaded,
        ),
      );
    }
  }

  Future<void> check() async {
    var healthy = false;
    try {
      emit(state.copyWith(status: FundwiseStatus.loading));
      healthy = await _health.check();
      emit(
        state.copyWith(
          healthy: () => healthy,
          status: FundwiseStatus.loaded,
        ),
      );
    } on Exception {
      healthy = false;
    } finally {
      emit(state.copyWith(status: FundwiseStatus.loaded));
    }
  }
}

class ServerState {
  const ServerState({
    required this.healthy,
    required this.url,
    required this.status,
  });

  final bool? healthy;
  final Uri? url;
  final FundwiseStatus status;

  ServerState copyWith({
    ValueGetter<bool?>? healthy,
    ValueGetter<Uri?>? url,
    FundwiseStatus? status,
  }) {
    return ServerState(
      healthy: healthy != null ? healthy() : this.healthy,
      url: url != null ? url() : this.url,
      status: status ?? this.status,
    );
  }
}
