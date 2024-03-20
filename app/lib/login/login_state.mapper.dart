// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'login_state.dart';

class LoginStatusMapper extends EnumMapper<LoginStatus> {
  LoginStatusMapper._();

  static LoginStatusMapper? _instance;
  static LoginStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginStatusMapper._());
    }
    return _instance!;
  }

  static LoginStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  LoginStatus decode(dynamic value) {
    switch (value) {
      case 'loaded':
        return LoginStatus.loaded;
      case 'loading':
        return LoginStatus.loading;
      case 'error':
        return LoginStatus.error;
      case 'success':
        return LoginStatus.success;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(LoginStatus self) {
    switch (self) {
      case LoginStatus.loaded:
        return 'loaded';
      case LoginStatus.loading:
        return 'loading';
      case LoginStatus.error:
        return 'error';
      case LoginStatus.success:
        return 'success';
    }
  }
}

extension LoginStatusMapperExtension on LoginStatus {
  String toValue() {
    LoginStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<LoginStatus>(this) as String;
  }
}

class LoginStateMapper extends ClassMapperBase<LoginState> {
  LoginStateMapper._();

  static LoginStateMapper? _instance;
  static LoginStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginStateMapper._());
      LoginStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoginState';

  static String _$username(LoginState v) => v.username;
  static const Field<LoginState, String> _f$username =
      Field('username', _$username);
  static String _$password(LoginState v) => v.password;
  static const Field<LoginState, String> _f$password =
      Field('password', _$password);
  static LoginStatus _$status(LoginState v) => v.status;
  static const Field<LoginState, LoginStatus> _f$status =
      Field('status', _$status, opt: true, def: LoginStatus.loaded);

  @override
  final MappableFields<LoginState> fields = const {
    #username: _f$username,
    #password: _f$password,
    #status: _f$status,
  };

  static LoginState _instantiate(DecodingData data) {
    return LoginState(
        username: data.dec(_f$username),
        password: data.dec(_f$password),
        status: data.dec(_f$status));
  }

  @override
  final Function instantiate = _instantiate;

  static LoginState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoginState>(map);
  }

  static LoginState fromJson(String json) {
    return ensureInitialized().decodeJson<LoginState>(json);
  }
}

mixin LoginStateMappable {
  String toJson() {
    return LoginStateMapper.ensureInitialized()
        .encodeJson<LoginState>(this as LoginState);
  }

  Map<String, dynamic> toMap() {
    return LoginStateMapper.ensureInitialized()
        .encodeMap<LoginState>(this as LoginState);
  }

  LoginStateCopyWith<LoginState, LoginState, LoginState> get copyWith =>
      _LoginStateCopyWithImpl(this as LoginState, $identity, $identity);
  @override
  String toString() {
    return LoginStateMapper.ensureInitialized()
        .stringifyValue(this as LoginState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LoginStateMapper.ensureInitialized()
                .isValueEqual(this as LoginState, other));
  }

  @override
  int get hashCode {
    return LoginStateMapper.ensureInitialized().hashValue(this as LoginState);
  }
}

extension LoginStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoginState, $Out> {
  LoginStateCopyWith<$R, LoginState, $Out> get $asLoginState =>
      $base.as((v, t, t2) => _LoginStateCopyWithImpl(v, t, t2));
}

abstract class LoginStateCopyWith<$R, $In extends LoginState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? username, String? password, LoginStatus? status});
  LoginStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LoginStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoginState, $Out>
    implements LoginStateCopyWith<$R, LoginState, $Out> {
  _LoginStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginState> $mapper =
      LoginStateMapper.ensureInitialized();
  @override
  $R call({String? username, String? password, LoginStatus? status}) =>
      $apply(FieldCopyWithData({
        if (username != null) #username: username,
        if (password != null) #password: password,
        if (status != null) #status: status
      }));
  @override
  LoginState $make(CopyWithData data) => LoginState(
      username: data.get(#username, or: $value.username),
      password: data.get(#password, or: $value.password),
      status: data.get(#status, or: $value.status));

  @override
  LoginStateCopyWith<$R2, LoginState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LoginStateCopyWithImpl($value, $cast, t);
}
