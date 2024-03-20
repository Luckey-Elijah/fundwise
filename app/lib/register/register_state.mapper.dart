// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'register_state.dart';

class RegisterStatusMapper extends EnumMapper<RegisterStatus> {
  RegisterStatusMapper._();

  static RegisterStatusMapper? _instance;
  static RegisterStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegisterStatusMapper._());
    }
    return _instance!;
  }

  static RegisterStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  RegisterStatus decode(dynamic value) {
    switch (value) {
      case 'loaded':
        return RegisterStatus.loaded;
      case 'loading':
        return RegisterStatus.loading;
      case 'error':
        return RegisterStatus.error;
      case 'success':
        return RegisterStatus.success;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(RegisterStatus self) {
    switch (self) {
      case RegisterStatus.loaded:
        return 'loaded';
      case RegisterStatus.loading:
        return 'loading';
      case RegisterStatus.error:
        return 'error';
      case RegisterStatus.success:
        return 'success';
    }
  }
}

extension RegisterStatusMapperExtension on RegisterStatus {
  String toValue() {
    RegisterStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<RegisterStatus>(this) as String;
  }
}

class RegisterStateMapper extends ClassMapperBase<RegisterState> {
  RegisterStateMapper._();

  static RegisterStateMapper? _instance;
  static RegisterStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegisterStateMapper._());
      RegisterStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RegisterState';

  static String _$email(RegisterState v) => v.email;
  static const Field<RegisterState, String> _f$email = Field('email', _$email);
  static String _$name(RegisterState v) => v.name;
  static const Field<RegisterState, String> _f$name = Field('name', _$name);
  static String _$username(RegisterState v) => v.username;
  static const Field<RegisterState, String> _f$username =
      Field('username', _$username);
  static String _$password(RegisterState v) => v.password;
  static const Field<RegisterState, String> _f$password =
      Field('password', _$password);
  static String _$passwordConfirm(RegisterState v) => v.passwordConfirm;
  static const Field<RegisterState, String> _f$passwordConfirm =
      Field('passwordConfirm', _$passwordConfirm);
  static bool _$emailVisibility(RegisterState v) => v.emailVisibility;
  static const Field<RegisterState, bool> _f$emailVisibility =
      Field('emailVisibility', _$emailVisibility, opt: true, def: true);
  static RegisterStatus _$status(RegisterState v) => v.status;
  static const Field<RegisterState, RegisterStatus> _f$status =
      Field('status', _$status, opt: true, def: RegisterStatus.loaded);

  @override
  final MappableFields<RegisterState> fields = const {
    #email: _f$email,
    #name: _f$name,
    #username: _f$username,
    #password: _f$password,
    #passwordConfirm: _f$passwordConfirm,
    #emailVisibility: _f$emailVisibility,
    #status: _f$status,
  };

  static RegisterState _instantiate(DecodingData data) {
    return RegisterState(
        email: data.dec(_f$email),
        name: data.dec(_f$name),
        username: data.dec(_f$username),
        password: data.dec(_f$password),
        passwordConfirm: data.dec(_f$passwordConfirm),
        emailVisibility: data.dec(_f$emailVisibility),
        status: data.dec(_f$status));
  }

  @override
  final Function instantiate = _instantiate;

  static RegisterState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RegisterState>(map);
  }

  static RegisterState fromJson(String json) {
    return ensureInitialized().decodeJson<RegisterState>(json);
  }
}

mixin RegisterStateMappable {
  String toJson() {
    return RegisterStateMapper.ensureInitialized()
        .encodeJson<RegisterState>(this as RegisterState);
  }

  Map<String, dynamic> toMap() {
    return RegisterStateMapper.ensureInitialized()
        .encodeMap<RegisterState>(this as RegisterState);
  }

  RegisterStateCopyWith<RegisterState, RegisterState, RegisterState>
      get copyWith => _RegisterStateCopyWithImpl(
          this as RegisterState, $identity, $identity);
  @override
  String toString() {
    return RegisterStateMapper.ensureInitialized()
        .stringifyValue(this as RegisterState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RegisterStateMapper.ensureInitialized()
                .isValueEqual(this as RegisterState, other));
  }

  @override
  int get hashCode {
    return RegisterStateMapper.ensureInitialized()
        .hashValue(this as RegisterState);
  }
}

extension RegisterStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RegisterState, $Out> {
  RegisterStateCopyWith<$R, RegisterState, $Out> get $asRegisterState =>
      $base.as((v, t, t2) => _RegisterStateCopyWithImpl(v, t, t2));
}

abstract class RegisterStateCopyWith<$R, $In extends RegisterState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? email,
      String? name,
      String? username,
      String? password,
      String? passwordConfirm,
      bool? emailVisibility,
      RegisterStatus? status});
  RegisterStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RegisterStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RegisterState, $Out>
    implements RegisterStateCopyWith<$R, RegisterState, $Out> {
  _RegisterStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RegisterState> $mapper =
      RegisterStateMapper.ensureInitialized();
  @override
  $R call(
          {String? email,
          String? name,
          String? username,
          String? password,
          String? passwordConfirm,
          bool? emailVisibility,
          RegisterStatus? status}) =>
      $apply(FieldCopyWithData({
        if (email != null) #email: email,
        if (name != null) #name: name,
        if (username != null) #username: username,
        if (password != null) #password: password,
        if (passwordConfirm != null) #passwordConfirm: passwordConfirm,
        if (emailVisibility != null) #emailVisibility: emailVisibility,
        if (status != null) #status: status
      }));
  @override
  RegisterState $make(CopyWithData data) => RegisterState(
      email: data.get(#email, or: $value.email),
      name: data.get(#name, or: $value.name),
      username: data.get(#username, or: $value.username),
      password: data.get(#password, or: $value.password),
      passwordConfirm: data.get(#passwordConfirm, or: $value.passwordConfirm),
      emailVisibility: data.get(#emailVisibility, or: $value.emailVisibility),
      status: data.get(#status, or: $value.status));

  @override
  RegisterStateCopyWith<$R2, RegisterState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RegisterStateCopyWithImpl($value, $cast, t);
}
