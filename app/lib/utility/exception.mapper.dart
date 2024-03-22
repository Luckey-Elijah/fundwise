// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'exception.dart';

class FundwiseExceptionMapper extends ClassMapperBase<FundwiseException> {
  FundwiseExceptionMapper._();

  static FundwiseExceptionMapper? _instance;
  static FundwiseExceptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FundwiseExceptionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FundwiseException';

  static Object? _$error(FundwiseException v) => v.error;
  static const Field<FundwiseException, Object> _f$error =
      Field('error', _$error, opt: true);
  static Object? _$message(FundwiseException v) => v.message;
  static const Field<FundwiseException, Object> _f$message =
      Field('message', _$message, opt: true);

  @override
  final MappableFields<FundwiseException> fields = const {
    #error: _f$error,
    #message: _f$message,
  };

  static FundwiseException _instantiate(DecodingData data) {
    return FundwiseException(
        error: data.dec(_f$error), message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static FundwiseException fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FundwiseException>(map);
  }

  static FundwiseException fromJson(String json) {
    return ensureInitialized().decodeJson<FundwiseException>(json);
  }
}

mixin FundwiseExceptionMappable {
  String toJson() {
    return FundwiseExceptionMapper.ensureInitialized()
        .encodeJson<FundwiseException>(this as FundwiseException);
  }

  Map<String, dynamic> toMap() {
    return FundwiseExceptionMapper.ensureInitialized()
        .encodeMap<FundwiseException>(this as FundwiseException);
  }

  FundwiseExceptionCopyWith<FundwiseException, FundwiseException,
          FundwiseException>
      get copyWith => _FundwiseExceptionCopyWithImpl(
          this as FundwiseException, $identity, $identity);
  @override
  String toString() {
    return FundwiseExceptionMapper.ensureInitialized()
        .stringifyValue(this as FundwiseException);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FundwiseExceptionMapper.ensureInitialized()
                .isValueEqual(this as FundwiseException, other));
  }

  @override
  int get hashCode {
    return FundwiseExceptionMapper.ensureInitialized()
        .hashValue(this as FundwiseException);
  }
}

extension FundwiseExceptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FundwiseException, $Out> {
  FundwiseExceptionCopyWith<$R, FundwiseException, $Out>
      get $asFundwiseException =>
          $base.as((v, t, t2) => _FundwiseExceptionCopyWithImpl(v, t, t2));
}

abstract class FundwiseExceptionCopyWith<$R, $In extends FundwiseException,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({Object? error, Object? message});
  FundwiseExceptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FundwiseExceptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FundwiseException, $Out>
    implements FundwiseExceptionCopyWith<$R, FundwiseException, $Out> {
  _FundwiseExceptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FundwiseException> $mapper =
      FundwiseExceptionMapper.ensureInitialized();
  @override
  $R call({Object? error = $none, Object? message = $none}) =>
      $apply(FieldCopyWithData({
        if (error != $none) #error: error,
        if (message != $none) #message: message
      }));
  @override
  FundwiseException $make(CopyWithData data) => FundwiseException(
      error: data.get(#error, or: $value.error),
      message: data.get(#message, or: $value.message));

  @override
  FundwiseExceptionCopyWith<$R2, FundwiseException, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FundwiseExceptionCopyWithImpl($value, $cast, t);
}
