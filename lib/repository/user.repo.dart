import 'package:app/repository/user.model.dart';
import 'package:pocketbase/pocketbase.dart';

class UserRepository {
  UserRepository({required PocketBase pb}) : _pb = pb;

  final PocketBase _pb;

  UserModel? get user {
    final model = _pb.authStore.model;
    if (model is RecordModel) return UserModel.fromJson(model.data);
    return null;
  }
}
