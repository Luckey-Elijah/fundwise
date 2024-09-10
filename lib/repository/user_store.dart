import 'package:app/repository/user_model.dart';
import 'package:pocketbase/pocketbase.dart';

class UserStore {
  UserStore({required PocketBase pb}) : _pb = pb;

  final PocketBase _pb;

  UserModel? get user {
    final model = _pb.authStore.model;
    if (model is RecordModel) return UserModel.fromJson(model.data);
    return null;
  }
}
