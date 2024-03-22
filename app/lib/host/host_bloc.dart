import 'package:app/host/host_state.dart';
import 'package:bloc/bloc.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HostBloc extends Bloc<HostEvent, HostState> {
  HostBloc({required SharedPreferences sharedPreferences})
      : _preferences = sharedPreferences,
        super(const HostState(status: HostStatus.loaded)) {
    on<InitializeEvent>((event, emit) async {
      try {
        if (!_preferences.containsKey(_key)) {
          return emit(const HostState(status: HostStatus.loaded));
        }

        final baseUrl = _preferences.getString(_key);

        emit(
          HostState(
            status: HostStatus.loaded,
            maybeUrl: baseUrl,
          ),
        );

        if (baseUrl == null) return;

        return emit(
          state.copyWith(
            url: Uri.tryParse(baseUrl),
            status: HostStatus.success,
          ),
        );
      } on Exception catch (e) {
        addError(e);
        emit(state.copyWith(status: HostStatus.error));
      }
    });

    on<_CheckUriHealth>(
      (event, emit) async {
        emit(state.copyWith(url: event.url));

        try {
          final baseUrl = '${event.url}';
          final health = await PocketBase(baseUrl).health.check();
          if (health.code case < 200 || > 299) {
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
      transformer: null, // todo: add a debounce
    );

    on<UpdateUri>((event, emit) async {
      final maybeUrl = event.maybeUrl;

      emit(
        state.copyWith(
          status: HostStatus.loaded,
          maybeUrl: maybeUrl,
          url: null,
        ),
      );

      if (maybeUrl == null) return;

      final url = Uri.tryParse(maybeUrl);

      if (url == null) {
        return emit(
          state.copyWith(
            status: HostStatus.error,
            url: null,
          ),
        );
      }

      add(_CheckUriHealth(url));

      return emit(state.copyWith(url: url));
    });
  }
  static const _key = 'host';

  final SharedPreferences _preferences;
}

abstract class HostEvent {}

class InitializeEvent extends HostEvent {}

class UpdateUri extends HostEvent {
  UpdateUri(this.maybeUrl);

  final String? maybeUrl;
}

class _CheckUriHealth extends HostEvent {
  _CheckUriHealth(this.url);

  final Uri url;
}
