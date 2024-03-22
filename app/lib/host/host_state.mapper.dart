// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'host_state.dart';

class HostStateMapper extends ClassMapperBase<HostState> {
  HostStateMapper._();

  static HostStateMapper? _instance;
  static HostStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HostStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HostState';

  static HostStatus _$status(HostState v) => v.status;
  static const Field<HostState, HostStatus> _f$status =
      Field('status', _$status);
  static Uri? _$url(HostState v) => v.url;
  static const Field<HostState, Uri> _f$url = Field('url', _$url, opt: true);
  static String? _$maybeUrl(HostState v) => v.maybeUrl;
  static const Field<HostState, String> _f$maybeUrl =
      Field('maybeUrl', _$maybeUrl, opt: true);

  @override
  final MappableFields<HostState> fields = const {
    #status: _f$status,
    #url: _f$url,
    #maybeUrl: _f$maybeUrl,
  };

  static HostState _instantiate(DecodingData data) {
    return HostState(
        status: data.dec(_f$status),
        url: data.dec(_f$url),
        maybeUrl: data.dec(_f$maybeUrl));
  }

  @override
  final Function instantiate = _instantiate;

  static HostState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HostState>(map);
  }

  static HostState fromJson(String json) {
    return ensureInitialized().decodeJson<HostState>(json);
  }
}

mixin HostStateMappable {
  String toJson() {
    return HostStateMapper.ensureInitialized()
        .encodeJson<HostState>(this as HostState);
  }

  Map<String, dynamic> toMap() {
    return HostStateMapper.ensureInitialized()
        .encodeMap<HostState>(this as HostState);
  }

  HostStateCopyWith<HostState, HostState, HostState> get copyWith =>
      _HostStateCopyWithImpl(this as HostState, $identity, $identity);
  @override
  String toString() {
    return HostStateMapper.ensureInitialized()
        .stringifyValue(this as HostState);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HostStateMapper.ensureInitialized()
                .isValueEqual(this as HostState, other));
  }

  @override
  int get hashCode {
    return HostStateMapper.ensureInitialized().hashValue(this as HostState);
  }
}

extension HostStateValueCopy<$R, $Out> on ObjectCopyWith<$R, HostState, $Out> {
  HostStateCopyWith<$R, HostState, $Out> get $asHostState =>
      $base.as((v, t, t2) => _HostStateCopyWithImpl(v, t, t2));
}

abstract class HostStateCopyWith<$R, $In extends HostState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({HostStatus? status, Uri? url, String? maybeUrl});
  HostStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HostStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HostState, $Out>
    implements HostStateCopyWith<$R, HostState, $Out> {
  _HostStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HostState> $mapper =
      HostStateMapper.ensureInitialized();
  @override
  $R call(
          {HostStatus? status,
          Object? url = $none,
          Object? maybeUrl = $none}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (url != $none) #url: url,
        if (maybeUrl != $none) #maybeUrl: maybeUrl
      }));
  @override
  HostState $make(CopyWithData data) => HostState(
      status: data.get(#status, or: $value.status),
      url: data.get(#url, or: $value.url),
      maybeUrl: data.get(#maybeUrl, or: $value.maybeUrl));

  @override
  HostStateCopyWith<$R2, HostState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HostStateCopyWithImpl($value, $cast, t);
}
