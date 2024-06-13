import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthListenable extends ChangeNotifier {
  AuthListenable(this.supabase) {
    final authStream = supabase.auth.onAuthStateChange;
    subscription = authStream.listen((AuthState auth) {
      stdout.writeln(auth.session?.user.email);
      notifyListeners();
    });
  }

  StreamSubscription<AuthState>? subscription;
  final SupabaseClient supabase;

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }
}
