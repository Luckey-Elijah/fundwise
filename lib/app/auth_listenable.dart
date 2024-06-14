import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthListenable extends ChangeNotifier {
  AuthListenable(this.onAuthStateChange) {
    subscription = onAuthStateChange.listen((AuthState auth) {
      stdout.writeln(auth.session?.user.email);
      notifyListeners();
    });
  }

  StreamSubscription<AuthState>? subscription;
  final Stream<AuthState> onAuthStateChange;

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }
}
