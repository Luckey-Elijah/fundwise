// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'date_format_model.dart';

class DateFormatModelMapper extends ClassMapperBase<DateFormatModel> {
  DateFormatModelMapper._();

  static DateFormatModelMapper? _instance;
  static DateFormatModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DateFormatModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DateFormatModel';

  static String _$id(DateFormatModel v) => v.id;
  static const Field<DateFormatModel, String> _f$id = Field('id', _$id);
  static String _$collectionId(DateFormatModel v) => v.collectionId;
  static const Field<DateFormatModel, String> _f$collectionId =
      Field('collectionId', _$collectionId, key: 'collection_id');
  static String _$collectionName(DateFormatModel v) => v.collectionName;
  static const Field<DateFormatModel, String> _f$collectionName =
      Field('collectionName', _$collectionName, key: 'collection_name');
  static String _$created(DateFormatModel v) => v.created;
  static const Field<DateFormatModel, String> _f$created =
      Field('created', _$created);
  static String _$updated(DateFormatModel v) => v.updated;
  static const Field<DateFormatModel, String> _f$updated =
      Field('updated', _$updated);
  static String _$description(DateFormatModel v) => v.description;
  static const Field<DateFormatModel, String> _f$description =
      Field('description', _$description);
  static String _$pattern(DateFormatModel v) => v.pattern;
  static const Field<DateFormatModel, String> _f$pattern =
      Field('pattern', _$pattern);

  @override
  final MappableFields<DateFormatModel> fields = const {
    #id: _f$id,
    #collectionId: _f$collectionId,
    #collectionName: _f$collectionName,
    #created: _f$created,
    #updated: _f$updated,
    #description: _f$description,
    #pattern: _f$pattern,
  };

  static DateFormatModel _instantiate(DecodingData data) {
    return DateFormatModel(
        id: data.dec(_f$id),
        collectionId: data.dec(_f$collectionId),
        collectionName: data.dec(_f$collectionName),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated),
        description: data.dec(_f$description),
        pattern: data.dec(_f$pattern));
  }

  @override
  final Function instantiate = _instantiate;

  static DateFormatModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DateFormatModel>(map);
  }

  static DateFormatModel fromJson(String json) {
    return ensureInitialized().decodeJson<DateFormatModel>(json);
  }
}

mixin DateFormatModelMappable {
  String toJson() {
    return DateFormatModelMapper.ensureInitialized()
        .encodeJson<DateFormatModel>(this as DateFormatModel);
  }

  Map<String, dynamic> toMap() {
    return DateFormatModelMapper.ensureInitialized()
        .encodeMap<DateFormatModel>(this as DateFormatModel);
  }

  DateFormatModelCopyWith<DateFormatModel, DateFormatModel, DateFormatModel>
      get copyWith => _DateFormatModelCopyWithImpl(
          this as DateFormatModel, $identity, $identity);
  @override
  String toString() {
    return DateFormatModelMapper.ensureInitialized()
        .stringifyValue(this as DateFormatModel);
  }

  @override
  bool operator ==(Object other) {
    return DateFormatModelMapper.ensureInitialized()
        .equalsValue(this as DateFormatModel, other);
  }

  @override
  int get hashCode {
    return DateFormatModelMapper.ensureInitialized()
        .hashValue(this as DateFormatModel);
  }
}

extension DateFormatModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DateFormatModel, $Out> {
  DateFormatModelCopyWith<$R, DateFormatModel, $Out> get $asDateFormatModel =>
      $base.as((v, t, t2) => _DateFormatModelCopyWithImpl(v, t, t2));
}

abstract class DateFormatModelCopyWith<$R, $In extends DateFormatModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? collectionId,
      String? collectionName,
      String? created,
      String? updated,
      String? description,
      String? pattern});
  DateFormatModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DateFormatModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DateFormatModel, $Out>
    implements DateFormatModelCopyWith<$R, DateFormatModel, $Out> {
  _DateFormatModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DateFormatModel> $mapper =
      DateFormatModelMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          String? collectionId,
          String? collectionName,
          String? created,
          String? updated,
          String? description,
          String? pattern}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (collectionId != null) #collectionId: collectionId,
        if (collectionName != null) #collectionName: collectionName,
        if (created != null) #created: created,
        if (updated != null) #updated: updated,
        if (description != null) #description: description,
        if (pattern != null) #pattern: pattern
      }));
  @override
  DateFormatModel $make(CopyWithData data) => DateFormatModel(
      id: data.get(#id, or: $value.id),
      collectionId: data.get(#collectionId, or: $value.collectionId),
      collectionName: data.get(#collectionName, or: $value.collectionName),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated),
      description: data.get(#description, or: $value.description),
      pattern: data.get(#pattern, or: $value.pattern));

  @override
  DateFormatModelCopyWith<$R2, DateFormatModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DateFormatModelCopyWithImpl($value, $cast, t);
}
