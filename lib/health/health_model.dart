import 'package:dart_mappable/dart_mappable.dart';

part 'health_model.mapper.dart';

@MappableClass()
class HealthModel with HealthModelMappable {
  HealthModel({required this.status, required this.message, required this.data});
  final int status;
  final String message;
  final HealthModelData? data;
}

@MappableClass()
class HealthModelData with HealthModelDataMappable {
  HealthModelData({required this.canBackup});
  final bool? canBackup;
}
