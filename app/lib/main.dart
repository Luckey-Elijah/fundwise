import 'package:app/app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  Bloc.observer = FundwiseBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final pocketbase = PocketBase(
    'http://127.0.0.1:8090',
    authStore: AsyncAuthStore(
      save: (data) async => prefs.setString('auth', data),
      initial: prefs.getString('auth'),
    ),
  );

  LicenseRegistry.addLicense(() async* {
    yield LicenseEntryWithLineBreaks(
      ['Open Sans'],
      await rootBundle.loadString('fonts/Open_Sans/OFL.txt'),
    );
    yield LicenseEntryWithLineBreaks(
      ['Roboto Mono'],
      await rootBundle.loadString('fonts/Roboto_Mono/LICENSE.txt'),
    );
  });

  return runApp(
    FundwiseApp(
      pocketbase: pocketbase,
      sharedPreferences: prefs,
    ),
  );
}
