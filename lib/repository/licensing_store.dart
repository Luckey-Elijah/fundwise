import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class LicensingStore {
  LicensingStore({required AssetBundle rootBundle}) : _rootBundle = rootBundle;

  final AssetBundle _rootBundle;

  Stream<LicenseEntry> fontLicenses() async* {
    const paths = [
      'assets/fonts/OFL-raleway.txt',
      'assets/fonts/OFL-plexmono.txt',
    ];

    for (final path in paths) {
      final license = await _rootBundle.loadString(path);
      yield LicenseEntryWithLineBreaks(['fundwise'], license);
    }
  }
}
