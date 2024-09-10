// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'login_state.dart';

class LoginOrSignUpStateMapper extends EnumMapper<LoginOrSignUpState> {
  LoginOrSignUpStateMapper._();

  static LoginOrSignUpStateMapper? _instance;
  static LoginOrSignUpStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginOrSignUpStateMapper._());
    }
    return _instance!;
  }

  static LoginOrSignUpState fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  LoginOrSignUpState decode(dynamic value) {
    switch (value) {
      case 'login':
        return LoginOrSignUpState.login;
      case 'signUp':
        return LoginOrSignUpState.signUp;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(LoginOrSignUpState self) {
    switch (self) {
      case LoginOrSignUpState.login:
        return 'login';
      case LoginOrSignUpState.signUp:
        return 'signUp';
    }
  }
}

extension LoginOrSignUpStateMapperExtension on LoginOrSignUpState {
  String toValue() {
    LoginOrSignUpStateMapper.ensureInitialized();
    return MapperContainer.globals.toValue<LoginOrSignUpState>(this) as String;
  }
}

class LoginStateMapper extends ClassMapperBase<LoginState> {
  LoginStateMapper._();

  static LoginStateMapper? _instance;
  static LoginStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginStateMapper._());
      LoginOrSignUpStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoginState';

  static String _$email(LoginState v) => v.email;
  static const Field<LoginState, String> _f$email = Field('email', _$email);
  static String _$password(LoginState v) => v.password;
  static const Field<LoginState, String> _f$password =
      Field('password', _$password);
  static String _$confirm(LoginState v) => v.confirm;
  static const Field<LoginState, String> _f$confirm =
      Field('confirm', _$confirm);
  static String _$username(LoginState v) => v.username;
  static const Field<LoginState, String> _f$username =
      Field('username', _$username);
  static LoginOrSignUpState _$loginOrSignUp(LoginState v) => v.loginOrSignUp;
  static const Field<LoginState, LoginOrSignUpState> _f$loginOrSignUp =
      Field('loginOrSignUp', _$loginOrSignUp);
  static bool _$rememberUsername(LoginState v) => v.rememberUsername;
  static const Field<LoginState, bool> _f$rememberUsername =
      Field('rememberUsername', _$rememberUsername);
  static String? _$error(LoginState v) => v.error;
  static const Field<LoginState, String> _f$error =
      Field('error', _$error, opt: true);
  static bool _$loading(LoginState v) => v.loading;
  static const Field<LoginState, bool> _f$loading =
      Field('loading', _$loading, opt: true, def: false);
  static String? _$signUpSuccess(LoginState v) => v.signUpSuccess;
  static const Field<LoginState, String> _f$signUpSuccess =
      Field('signUpSuccess', _$signUpSuccess, opt: true);

  @override
  final MappableFields<LoginState> fields = const {
    #email: _f$email,
    #password: _f$password,
    #confirm: _f$confirm,
    #username: _f$username,
    #loginOrSignUp: _f$loginOrSignUp,
    #rememberUsername: _f$rememberUsername,
    #error: _f$error,
    #loading: _f$loading,
    #signUpSuccess: _f$signUpSuccess,
  };

  static LoginState _instantiate(DecodingData data) {
    return LoginState(
        email: data.dec(_f$email),
        password: data.dec(_f$password),
        confirm: data.dec(_f$confirm),
        username: data.dec(_f$username),
        loginOrSignUp: data.dec(_f$loginOrSignUp),
        rememberUsername: data.dec(_f$rememberUsername),
        error: data.dec(_f$error),
        loading: data.dec(_f$loading),
        signUpSuccess: data.dec(_f$signUpSuccess));
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
    return LoginStateMapper.ensureInitialized()
        .equalsValue(this as LoginState, other);
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
  $R call(
      {String? email,
      String? password,
      String? confirm,
      String? username,
      LoginOrSignUpState? loginOrSignUp,
      bool? rememberUsername,
      String? error,
      bool? loading,
      String? signUpSuccess});
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
  $R call(
          {String? email,
          String? password,
          String? confirm,
          String? username,
          LoginOrSignUpState? loginOrSignUp,
          bool? rememberUsername,
          Object? error = $none,
          bool? loading,
          Object? signUpSuccess = $none}) =>
      $apply(FieldCopyWithData({
        if (email != null) #email: email,
        if (password != null) #password: password,
        if (confirm != null) #confirm: confirm,
        if (username != null) #username: username,
        if (loginOrSignUp != null) #loginOrSignUp: loginOrSignUp,
        if (rememberUsername != null) #rememberUsername: rememberUsername,
        if (error != $none) #error: error,
        if (loading != null) #loading: loading,
        if (signUpSuccess != $none) #signUpSuccess: signUpSuccess
      }));
  @override
  LoginState $make(CopyWithData data) => LoginState(
      email: data.get(#email, or: $value.email),
      password: data.get(#password, or: $value.password),
      confirm: data.get(#confirm, or: $value.confirm),
      username: data.get(#username, or: $value.username),
      loginOrSignUp: data.get(#loginOrSignUp, or: $value.loginOrSignUp),
      rememberUsername:
          data.get(#rememberUsername, or: $value.rememberUsername),
      error: data.get(#error, or: $value.error),
      loading: data.get(#loading, or: $value.loading),
      signUpSuccess: data.get(#signUpSuccess, or: $value.signUpSuccess));

  @override
  LoginStateCopyWith<$R2, LoginState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LoginStateCopyWithImpl($value, $cast, t);
}
