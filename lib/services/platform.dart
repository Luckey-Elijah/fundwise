import 'dart:io';

import 'package:flutter/foundation.dart';

final isDesktop = Platform.isMacOS || Platform.isWindows || Platform.isLinux;
const isWeb = kIsWeb;
final isMobile = !isDesktop;
