import 'dart:async';

import 'package:app/components/status.dart' show FundwiseStatus;
import 'package:app/repository/health_store.dart';
import 'package:app/repository/url_store.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show ValueGetter;
import 'package:flutter/material.dart';

extension ValidUrl on Uri? {
  bool get valid {
    final url = this;
    if (url == null) return false;
    return url.isScheme('HTTP') || url.isScheme('HTTPS');
  }
}

mixin SubscriptionClosable<T> on BlocBase<T> {
  final _subscriptions = <StreamSubscription<Object?>>[];

  void registerSubscription(StreamSubscription<Object?> subscription) {
    _subscriptions.add(subscription);
  }

  @override
  Future<void> close() async {
    for (final sub in _subscriptions) {
      await sub.cancel();
    }
    return super.close();
  }
}

class ServerCubit extends Cubit<ServerState>
    with SubscriptionClosable<ServerState> {
  ServerCubit()
      : super(
          const ServerState(
            healthy: null,
            url: null,
            status: FundwiseStatus.initial,
          ),
        );

  Future<void> initialize() async {
    final url = await url$.getUrl();
    emit(
      state.copyWith(
        url: () => url,
        status: FundwiseStatus.loaded,
      ),
    );

    await check();
  }

  Future<void> updateUrl(String text) async {
    final url = Uri.tryParse(text);
    if (state.url == url) return;
    if (url.valid) {
      await url$.setUrl(url);
      emit(state.copyWith(url: () => url));
    }
  }

  Future<void> check() async {
    var healthy = false;

    try {
      emit(state.copyWith(status: FundwiseStatus.loading));
      healthy = await health$.check();
    } on Exception {
      healthy = false;
    }

    emit(
      state.copyWith(
        healthy: () => healthy,
        status: FundwiseStatus.loaded,
      ),
    );
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
