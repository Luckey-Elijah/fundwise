import 'package:app/host/host_state.dart';
import 'package:bloc/bloc.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _key = 'host';

class HostBloc extends Bloc<HostEvent, HostState> {
  HostBloc({required SharedPreferences sharedPreferences})
      : _preferences = sharedPreferences,
        super(const HostState(status: HostStatus.loaded)) {
    on<Initialize>((event, emit) async {
      emit(const HostState(status: HostStatus.loading));

      try {
        if (!_preferences.containsKey(_key)) return;

        final baseUrl = _preferences.getString(_key);

        emit(
          HostState(
            status: HostStatus.loaded,
            maybeUrl: baseUrl,
          ),
        );

        if (baseUrl == null) return;

        return emit(state.copyWith(url: Uri.tryParse(baseUrl)));
      } on Exception catch (e) {
        addError(e);
      }
    });
    on<_CheckUriHealth>(
      (event, emit) async {
        emit(
          state.copyWith(
            status: HostStatus.loading,
            url: event.url,
          ),
        );
        try {
          final baseUrl = '${event.url}';
          final health = await PocketBase(baseUrl).health.check();
          if (health.code case < 200 && > 299) {
            await _preferences.setString(_key, baseUrl);
            return emit(state.copyWith(status: HostStatus.success));
          } else {
            return emit(state.copyWith(status: HostStatus.error));
          }
        } on Exception catch (e) {
          addError(e);
          return emit(state.copyWith(status: HostStatus.error));
        }
      },
    );
    on<UpdateUri>((event, emit) async {
      final maybeUrl = event.maybeUrl;

      emit(
        state.copyWith(
          status: HostStatus.loading,
          maybeUrl: maybeUrl,
          url: null,
        ),
      );

      if (maybeUrl == null) {
        return emit(state.copyWith(status: HostStatus.loaded));
      }

      final url = Uri.tryParse(maybeUrl);

      if (url == null) {
        return emit(state.copyWith(status: HostStatus.error));
      }

      final isWebServer = url.isScheme('HTTP') || url.isScheme('HTTPS');

      if (!isWebServer) {
        return emit(state.copyWith(url: url, status: HostStatus.error));
      }

      add(_CheckUriHealth(url));

      return emit(state.copyWith(url: url, status: HostStatus.loading));
    });
  }

  final SharedPreferences _preferences;
}

abstract class HostEvent {}

class Initialize extends HostEvent {}

class UpdateUri extends HostEvent {
  UpdateUri(this.maybeUrl);

  final String? maybeUrl;
}

class _CheckUriHealth extends HostEvent {
  _CheckUriHealth(this.url);

  final Uri url;
}
