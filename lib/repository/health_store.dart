import 'dart:io';

import 'package:app/repository/pocketbase.dart';
import 'package:pocketbase/pocketbase.dart';

final health$ = HealthStore(pb: pocketbase$);

class HealthStore {
  HealthStore({required PocketBase pb}) : _pb = pb;

  final PocketBase _pb;

  Future<bool> check() async {
    try {
      final health = await _pb.health.check();
      return health.code == HttpStatus.ok;
    } on Exception {
      return false;
    }
  }
}
