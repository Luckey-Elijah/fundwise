import 'package:app/repository/user.model.dart';
import 'package:pocketbase/pocketbase.dart';

export 'package:pocketbase/pocketbase.dart' show AuthStoreEvent;

class AuthRepository {
  AuthRepository({required PocketBase pb}) : _pb = pb;

  final PocketBase _pb;

  Stream<AuthStoreEvent> get stream => _pb.authStore.onChange;

  UserModel? get user {
    final model = _pb.authStore.model;
    if (model is RecordModel) return UserModel.fromJson(model.data);
    return null;
  }

  void signOut() {
    _pb.authStore.clear();
  }

  Future<void> refresh() async {
    await _pb.collection('users').authRefresh();
  }

  Future<void> signIn({
    required String usernameOrEmail,
    required String password,
  }) async {
    await _pb.collection('users').authWithPassword(
          usernameOrEmail,
          password,
        );
  }

  Future<void> signUp({
    required String? username,
    required String? email,
    required String password,
    required String confirm,
  }) async {
    if (password != confirm) return;
    await _pb.collection('users').create(
      body: {
        'email': email,
        'username': username,
        'password': password,
        'emailVisibility': true,
        'passwordConfirm': confirm,
      },
    );
  }
}
