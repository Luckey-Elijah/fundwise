import 'package:fundwise/health/health_model.dart';
import 'package:fundwise/services/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'health.g.dart';

@Riverpod(keepAlive: true)
Future<HealthModel> health(Ref ref) async {
  var didDispose = false;
  ref.onDispose(() => didDispose = true);
  await Future<void>.delayed(const Duration(milliseconds: 1000));
  if (didDispose) throw Exception('Cancelled');

  final check = await ref.watch(pocketbaseProvider.select((pb) => pb.health.check()));

  return HealthModel(
    status: check.code,
    message: check.message,
    data: HealthModelDataMapper.fromMap(check.data),
  );
}
