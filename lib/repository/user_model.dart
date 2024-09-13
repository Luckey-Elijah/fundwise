import 'package:dart_mappable/dart_mappable.dart';

part 'user_model.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class UserModel with UserModelMappable {
  UserModel({
    required this.id,
    required this.username,
    required this.verified,
    required this.email,
    required this.created,
    required this.updated,
    required this.name,
    required this.avatar,
  });

  final String id;
  final String username;
  final bool verified;
  final String email;
  final String created;
  final String updated;
  final String name;
  final String avatar;
}
