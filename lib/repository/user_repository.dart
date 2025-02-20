import 'package:app/repository/model_to_map.dart';
import 'package:app/repository/user_model.dart';
import 'package:pocketbase/pocketbase.dart';

class UserRepository {
  UserRepository({required PocketBase pb}) : _pb = pb;

  final PocketBase _pb;

  UserModel? get user {
    final model = _pb.authStore.record;
    if (model != null) return UserModelMapper.fromMap(modelToMap(model));
    return null;
  }
}
