import 'package:pocketbase/pocketbase.dart';

class UserRepository {
  UserRepository({required PocketBase pb}) : _pb = pb;

  final PocketBase _pb;

  // TODO(elijah): create user model
  RecordModel? get user {
    final model = _pb.authStore.model;
    if (model is RecordModel) return model;
    return null;
  }
}
