import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/health/health_model.dart';
import 'package:fundwise/services/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'health.g.dart';

@riverpod
Future<HealthModel> health(Ref ref) async {
  final check = await ref.watch(pocketbaseProvider.select((pb) => pb.health.check()));

  return HealthModel(
    status: check.code,
    message: check.message,
    data: HealthModelDataMapper.fromMap(check.data),
  );
}
