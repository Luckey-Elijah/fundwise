import 'package:app/repository/pocketbase.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final url$ = UrlStore(pb: pocketbase$, prefs: preferences$);

class UrlStore {
  UrlStore({
    required PocketBase pb,
    required SharedPreferences prefs,
  })  : _pb = pb,
        _prefs = prefs;

  final PocketBase _pb;
  final SharedPreferences _prefs;

  Future<Uri?> getUrl() async {
    // use stored value first
    final maybeRaw = _prefs.getString(key);

    if (maybeRaw != null) {
      // there is a value but it might be bad
      final maybe = Uri.tryParse(maybeRaw);
      if (maybe != null) {
        _pb.baseUrl = '$maybe';
        return maybe;
      }

      // the stored value is bad - clean up
      await _prefs.remove(key);
    }

    // no stored value - but might be in pocketbase field
    final maybe = Uri.tryParse(_pb.baseUrl);
    if (maybe == null) {
      return null;
    }

    await _prefs.setString(key, '$maybe');
    return maybe;
  }

  static const key = 'server-url';

  Future<void> setUrl(Uri? url) async {
    if (url == null) {
      await _prefs.remove(key);
      _pb.baseUrl = '';
      _pb.authStore.clear();
      return;
    }

    await _prefs.setString(key, '$url');
    _pb.baseUrl = '$url';
    _pb.authStore.clear();
  }
}
