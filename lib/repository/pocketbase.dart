import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences preferences$;

final pocketbase$ = PocketBase(
  '',
  authStore: AsyncAuthStore(
    save: (data) async => preferences$.setString('pb_auth', data),
    initial: preferences$.getString('pb_auth'),
  ),
);
