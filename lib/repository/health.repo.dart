import 'dart:io';

import 'package:pocketbase/pocketbase.dart';

class HealthRepository {
  HealthRepository({required PocketBase pb}) : _pb = pb;

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
