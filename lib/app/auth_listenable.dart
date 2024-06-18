import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:pocketbase/pocketbase.dart';

class AuthListenable extends ChangeNotifier {
  AuthListenable(this.onAuthStateChange) {
    subscription = onAuthStateChange.listen(
      (event) {
        final model = event.model;
        if (model is RecordModel) {
          debugPrint('${model.toJson()}');
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
