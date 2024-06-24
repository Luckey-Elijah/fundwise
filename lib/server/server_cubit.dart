import 'package:app/repository/health.repo.dart';
import 'package:app/repository/url.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServerState {
  const ServerState({required this.healthy, required this.url});

  final bool? healthy;
  final Uri? url;
}

class ServerCubit extends Cubit<ServerState> {
  ServerCubit({
    required this.urlRepository,
    required this.healthRepository,
  }) : super(const ServerState(healthy: null, url: null));

  final UrlRepository urlRepository;
  final HealthRepository healthRepository;

  Future<void> initialize() async {
    emit(
      ServerState(
        healthy: state.healthy,
        url: await urlRepository.getUrl(),
      ),
    );
  }

  Future<void> updateUrl(String text) async {
    final url = Uri.tryParse(text);

    emit(
      ServerState(
        healthy: state.healthy,
        url: url,
      ),
    );

    await urlRepository.setUrl(url);
  }

  Future<void> check() async {
    var healthy = false;

    try {
      healthy = await healthRepository.check();
    } on Exception {
      healthy = false;
    }

    emit(
      ServerState(
        healthy: healthy,
        url: state.url,
      ),
    );
  }
}
