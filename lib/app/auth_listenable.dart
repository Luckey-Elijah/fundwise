import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:pocketbase/pocketbase.dart';

class AuthListenable extends ChangeNotifier {
  AuthListenable(this.onAuthStateChange) {
    subscription = onAuthStateChange.listen(
      (event) {
        final model = event.model;
        if (model is RecordModel) {
          stdout.writeln(model.toJson());
        }
        notifyListeners();
      },
    );
  }

  late final StreamSubscription<AuthStoreEvent> subscription;
  final Stream<AuthStoreEvent> onAuthStateChange;

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
