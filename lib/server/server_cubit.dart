import 'package:app/components/status.dart';
import 'package:app/repository/health_store.dart';
import 'package:app/repository/url_store.dart';
import 'package:flutter/widgets.dart' show ValueGetter;
import 'package:flutter_bloc/flutter_bloc.dart';

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

class ServerCubit extends Cubit<ServerState> {
  ServerCubit({
    required this.urlRepository,
    required this.healthRepository,
  }) : super(
          const ServerState(
            healthy: null,
            url: null,
            status: FundwiseStatus.initial,
          ),
        );

  final UrlStore urlRepository;
  final HealthStore healthRepository;

  Future<void> initialize() async {
    final url = await urlRepository.getUrl();
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
    await urlRepository.setUrl(url);

    return emit(state.copyWith(url: () => url));
  }

  Future<void> check() async {
    var healthy = false;

    try {
      emit(state.copyWith(status: FundwiseStatus.loading));
      healthy = await healthRepository.check();
    } on Exception {
      healthy = false;
    }

    return emit(
      state.copyWith(
        healthy: () => healthy,
        status: FundwiseStatus.loaded,
      ),
    );
  }
}
