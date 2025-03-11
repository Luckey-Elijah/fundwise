import 'package:dart_mappable/dart_mappable.dart';
import 'package:fundwise/services/collection.dart';

part 'user_model.mapper.dart';

@MappableClass()
class UserModel with UserModelMappable, CollectionModel {
  UserModel({
    required this.email,
    required this.name,
    required this.created,
    required this.updated,
    required this.id,
  });

  final String? name;
  final String email;

  @override
  final String id;
  @override
  final DateTime created;
  @override
  final DateTime updated;
}
