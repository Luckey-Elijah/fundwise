import 'package:app/util.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.username,
    required this.verified,
    required this.emailVisibility,
    required this.email,
    required this.created,
    required this.updated,
    required this.name,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map.tryString('id') ?? '',
      collectionId: map.tryString('collectionId') ?? '',
      collectionName: map.tryString('collectionName') ?? '',
      username: map.tryString('username') ?? '',
      verified: map.tryBool('verified') ?? false,
      emailVisibility: map.tryBool('emailVisibility') ?? false,
      email: map.tryString('email') ?? '',
      created: map.tryString('created') ?? '',
      updated: map.tryString('updated') ?? '',
      name: map.tryString('name') ?? '',
      avatar: map.tryString('avatar') ?? '',
    );
  }

  final String id;
  final String collectionId;
  final String collectionName;
  final String username;
  final bool verified;
  final bool emailVisibility;
  final String email;
  final String created;
  final String updated;
  final String name;
  final String avatar;
}
