import 'package:fundwise/root/router.dart';
import 'package:fundwise/services/pocketbase.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  @override
  Stream<RecordModel?> build() async* {
    final authStore = ref.watch(pocketbaseProvider.select((pb) => pb.authStore));

    listenSelf((previous, next) {
      if (!ref.read(pocketbaseProvider).authStore.isValid) {
        ref.read(routerProvider).navigate(LoginRoute());
      }
    });

    yield authStore.record;
    await for (final event in authStore.onChange) {
      yield event.record;
    }
  }
}
