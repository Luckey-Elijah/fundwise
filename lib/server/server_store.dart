import 'package:app/components/status.dart';
import 'package:app/repository/health_store.dart';
import 'package:app/repository/url_store.dart';
import 'package:flutter/foundation.dart';

final server$ = ServerStore()..initialize();

class ServerStore extends ValueNotifier<ServerState> {
  ServerStore()
      : super(
          const ServerState(
            healthy: null,
            url: null,
            status: FundwiseStatus.initial,
          ),
        );

  Future<void> initialize() async {
    final url = await url$.getUrl();
    value = value.copyWith(
      url: () => url,
      status: FundwiseStatus.loaded,
    );

    await check();
  }

  Future<void> updateUrl(String text) async {
    final url = Uri.tryParse(text);
    await url$.setUrl(url);

    value = value.copyWith(url: () => url);
    return;
  }

  Future<void> check() async {
    var healthy = false;

    try {
      value = value.copyWith(status: FundwiseStatus.loading);
      healthy = await health$.check();
    } on Exception {
      healthy = false;
    }

    value = value.copyWith(
      healthy: () => healthy,
      status: FundwiseStatus.loaded,
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
