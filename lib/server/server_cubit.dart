import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServerState {
  const ServerState({required this.healthy, required this.url});

  final bool? healthy;
  final Uri? url;
}

class ServerCubit extends Cubit<ServerState> {
  ServerCubit({
    required this.pb,
    required this.prefs,
  }) : super(const ServerState(healthy: null, url: null));

  final PocketBase pb;
  final SharedPreferences prefs;
  static const key = 'server-url';

  Future<void> initialize() async {
    final maybeUrl = prefs.getString(key);
    if (maybeUrl == null) return;
    emit(
      ServerState(
        healthy: state.healthy,
        url: Uri.tryParse(maybeUrl),
      ),
    );
  }

  Future<void> updateUrl(String text) async {
    emit(
      ServerState(
        healthy: state.healthy,
        url: Uri.tryParse(text),
      ),
    );

    final baseUrl = '${state.url}';
    pb.baseUrl = baseUrl;
    await prefs.setString(key, baseUrl);
  }

  Future<void> check() async {
    try {
      final check = await pb.health.check();

      emit(
        ServerState(
          healthy: check.code == 200,
          url: state.url,
        ),
      );
    } on Exception {
      emit(
        ServerState(
          healthy: false,
          url: state.url,
        ),
      );
    }
  }
}
