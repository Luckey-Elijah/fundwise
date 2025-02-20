import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UrlRepository {
  UrlRepository({
    required PocketBase pb,
    required SharedPreferences prefs,
  })  : _pb = pb,
        _prefs = prefs;

  final PocketBase _pb;
  final SharedPreferences _prefs;

  Future<Uri?> getUrl() async {
    // use stored value first
    final maybeRaw = _prefs.getString(_key);

    if (maybeRaw != null) {
      // there is a value but it might be bad
      final maybe = Uri.tryParse(maybeRaw);
      if (maybe != null) {
        _pb.baseURL = '$maybe';
        return maybe;
      }

      // the stored value is bad - clean up
      await _prefs.remove(_key);
    }

    // no stored value - but might be in pocketbase field
    final maybe = Uri.tryParse(_pb.baseURL);
    if (maybe == null) {
      return null;
    }

    await _prefs.setString(_key, '$maybe');
    return maybe;
  }

  static const _key = 'server-url';

  Future<void> setUrl(Uri? url) async {
    if (url == null) {
      await _prefs.remove(_key);
      _pb.baseURL = '';
      _pb.authStore.clear();
      return;
    }

    await _prefs.setString(_key, '$url');
    _pb.baseURL = '$url';
    _pb.authStore.clear();
  }
}
