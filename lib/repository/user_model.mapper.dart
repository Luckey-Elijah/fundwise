// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_model.dart';

class UserModelMapper extends ClassMapperBase<UserModel> {
  UserModelMapper._();

  static UserModelMapper? _instance;
  static UserModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserModel';

  static String _$id(UserModel v) => v.id;
  static const Field<UserModel, String> _f$id = Field('id', _$id);
  static String _$username(UserModel v) => v.username;
  static const Field<UserModel, String> _f$username =
      Field('username', _$username);
  static bool _$verified(UserModel v) => v.verified;
  static const Field<UserModel, bool> _f$verified =
      Field('verified', _$verified);
  static String _$email(UserModel v) => v.email;
  static const Field<UserModel, String> _f$email = Field('email', _$email);
  static String _$created(UserModel v) => v.created;
  static const Field<UserModel, String> _f$created =
      Field('created', _$created);
  static String _$updated(UserModel v) => v.updated;
  static const Field<UserModel, String> _f$updated =
      Field('updated', _$updated);
  static String _$name(UserModel v) => v.name;
  static const Field<UserModel, String> _f$name = Field('name', _$name);
  static String _$avatar(UserModel v) => v.avatar;
  static const Field<UserModel, String> _f$avatar = Field('avatar', _$avatar);

  @override
  final MappableFields<UserModel> fields = const {
    #id: _f$id,
    #username: _f$username,
    #verified: _f$verified,
    #email: _f$email,
    #created: _f$created,
    #updated: _f$updated,
    #name: _f$name,
    #avatar: _f$avatar,
  };

  static UserModel _instantiate(DecodingData data) {
    return UserModel(
        id: data.dec(_f$id),
        username: data.dec(_f$username),
        verified: data.dec(_f$verified),
        email: data.dec(_f$email),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated),
        name: data.dec(_f$name),
        avatar: data.dec(_f$avatar));
  }

  @override
  final Function instantiate = _instantiate;

  static UserModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserModel>(map);
  }

  static UserModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserModel>(json);
  }
}

mixin UserModelMappable {
  String toJson() {
    return UserModelMapper.ensureInitialized()
        .encodeJson<UserModel>(this as UserModel);
  }

  Map<String, dynamic> toMap() {
    return UserModelMapper.ensureInitialized()
        .encodeMap<UserModel>(this as UserModel);
  }

  UserModelCopyWith<UserModel, UserModel, UserModel> get copyWith =>
      _UserModelCopyWithImpl(this as UserModel, $identity, $identity);
  @override
  String toString() {
    return UserModelMapper.ensureInitialized()
        .stringifyValue(this as UserModel);
  }

  @override
  bool operator ==(Object other) {
    return UserModelMapper.ensureInitialized()
        .equalsValue(this as UserModel, other);
  }

  @override
  int get hashCode {
    return UserModelMapper.ensureInitialized().hashValue(this as UserModel);
  }
}

extension UserModelValueCopy<$R, $Out> on ObjectCopyWith<$R, UserModel, $Out> {
  UserModelCopyWith<$R, UserModel, $Out> get $asUserModel =>
      $base.as((v, t, t2) => _UserModelCopyWithImpl(v, t, t2));
}

abstract class UserModelCopyWith<$R, $In extends UserModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? username,
      bool? verified,
      String? email,
      String? created,
      String? updated,
      String? name,
      String? avatar});
  UserModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserModel, $Out>
    implements UserModelCopyWith<$R, UserModel, $Out> {
  _UserModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserModel> $mapper =
      UserModelMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          String? username,
          bool? verified,
          String? email,
          String? created,
          String? updated,
          String? name,
          String? avatar}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (username != null) #username: username,
        if (verified != null) #verified: verified,
        if (email != null) #email: email,
        if (created != null) #created: created,
        if (updated != null) #updated: updated,
        if (name != null) #name: name,
        if (avatar != null) #avatar: avatar
      }));
  @override
  UserModel $make(CopyWithData data) => UserModel(
      id: data.get(#id, or: $value.id),
      username: data.get(#username, or: $value.username),
      verified: data.get(#verified, or: $value.verified),
      email: data.get(#email, or: $value.email),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated),
      name: data.get(#name, or: $value.name),
      avatar: data.get(#avatar, or: $value.avatar));

  @override
  UserModelCopyWith<$R2, UserModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserModelCopyWithImpl($value, $cast, t);
}
