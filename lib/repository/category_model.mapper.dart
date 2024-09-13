// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'category_model.dart';

class CategoryModelMapper extends ClassMapperBase<CategoryModel> {
  CategoryModelMapper._();

  static CategoryModelMapper? _instance;
  static CategoryModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CategoryModel';

  static String _$id(CategoryModel v) => v.id;
  static const Field<CategoryModel, String> _f$id = Field('id', _$id);
  static String _$name(CategoryModel v) => v.name;
  static const Field<CategoryModel, String> _f$name = Field('name', _$name);
  static bool _$hidden(CategoryModel v) => v.hidden;
  static const Field<CategoryModel, bool> _f$hidden = Field('hidden', _$hidden);

  @override
  final MappableFields<CategoryModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #hidden: _f$hidden,
  };

  static CategoryModel _instantiate(DecodingData data) {
    return CategoryModel(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        hidden: data.dec(_f$hidden));
  }

  @override
  final Function instantiate = _instantiate;

  static CategoryModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CategoryModel>(map);
  }

  static CategoryModel fromJson(String json) {
    return ensureInitialized().decodeJson<CategoryModel>(json);
  }
}

mixin CategoryModelMappable {
  String toJson() {
    return CategoryModelMapper.ensureInitialized()
        .encodeJson<CategoryModel>(this as CategoryModel);
  }

  Map<String, dynamic> toMap() {
    return CategoryModelMapper.ensureInitialized()
        .encodeMap<CategoryModel>(this as CategoryModel);
  }

  CategoryModelCopyWith<CategoryModel, CategoryModel, CategoryModel>
      get copyWith => _CategoryModelCopyWithImpl(
          this as CategoryModel, $identity, $identity);
  @override
  String toString() {
    return CategoryModelMapper.ensureInitialized()
        .stringifyValue(this as CategoryModel);
  }

  @override
  bool operator ==(Object other) {
    return CategoryModelMapper.ensureInitialized()
        .equalsValue(this as CategoryModel, other);
  }

  @override
  int get hashCode {
    return CategoryModelMapper.ensureInitialized()
        .hashValue(this as CategoryModel);
  }
}

extension CategoryModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoryModel, $Out> {
  CategoryModelCopyWith<$R, CategoryModel, $Out> get $asCategoryModel =>
      $base.as((v, t, t2) => _CategoryModelCopyWithImpl(v, t, t2));
}

abstract class CategoryModelCopyWith<$R, $In extends CategoryModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name, bool? hidden});
  CategoryModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CategoryModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoryModel, $Out>
    implements CategoryModelCopyWith<$R, CategoryModel, $Out> {
  _CategoryModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CategoryModel> $mapper =
      CategoryModelMapper.ensureInitialized();
  @override
  $R call({String? id, String? name, bool? hidden}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (hidden != null) #hidden: hidden
      }));
  @override
  CategoryModel $make(CopyWithData data) => CategoryModel(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      hidden: data.get(#hidden, or: $value.hidden));

  @override
  CategoryModelCopyWith<$R2, CategoryModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CategoryModelCopyWithImpl($value, $cast, t);
}

class CategoryGroupModelMapper extends ClassMapperBase<CategoryGroupModel> {
  CategoryGroupModelMapper._();

  static CategoryGroupModelMapper? _instance;
  static CategoryGroupModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryGroupModelMapper._());
      CategoryModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CategoryGroupModel';

  static String _$id(CategoryGroupModel v) => v.id;
  static const Field<CategoryGroupModel, String> _f$id = Field('id', _$id);
  static String _$name(CategoryGroupModel v) => v.name;
  static const Field<CategoryGroupModel, String> _f$name =
      Field('name', _$name);
  static bool _$hidden(CategoryGroupModel v) => v.hidden;
  static const Field<CategoryGroupModel, bool> _f$hidden =
      Field('hidden', _$hidden);
  static List<CategoryModel> _$categories(CategoryGroupModel v) => v.categories;
  static const Field<CategoryGroupModel, List<CategoryModel>> _f$categories =
      Field('categories', _$categories);

  @override
  final MappableFields<CategoryGroupModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #hidden: _f$hidden,
    #categories: _f$categories,
  };

  static CategoryGroupModel _instantiate(DecodingData data) {
    return CategoryGroupModel(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        hidden: data.dec(_f$hidden),
        categories: data.dec(_f$categories));
  }

  @override
  final Function instantiate = _instantiate;

  static CategoryGroupModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CategoryGroupModel>(map);
  }

  static CategoryGroupModel fromJson(String json) {
    return ensureInitialized().decodeJson<CategoryGroupModel>(json);
  }
}

mixin CategoryGroupModelMappable {
  String toJson() {
    return CategoryGroupModelMapper.ensureInitialized()
        .encodeJson<CategoryGroupModel>(this as CategoryGroupModel);
  }

  Map<String, dynamic> toMap() {
    return CategoryGroupModelMapper.ensureInitialized()
        .encodeMap<CategoryGroupModel>(this as CategoryGroupModel);
  }

  CategoryGroupModelCopyWith<CategoryGroupModel, CategoryGroupModel,
          CategoryGroupModel>
      get copyWith => _CategoryGroupModelCopyWithImpl(
          this as CategoryGroupModel, $identity, $identity);
  @override
  String toString() {
    return CategoryGroupModelMapper.ensureInitialized()
        .stringifyValue(this as CategoryGroupModel);
  }

  @override
  bool operator ==(Object other) {
    return CategoryGroupModelMapper.ensureInitialized()
        .equalsValue(this as CategoryGroupModel, other);
  }

  @override
  int get hashCode {
    return CategoryGroupModelMapper.ensureInitialized()
        .hashValue(this as CategoryGroupModel);
  }
}

extension CategoryGroupModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoryGroupModel, $Out> {
  CategoryGroupModelCopyWith<$R, CategoryGroupModel, $Out>
      get $asCategoryGroupModel =>
          $base.as((v, t, t2) => _CategoryGroupModelCopyWithImpl(v, t, t2));
}

abstract class CategoryGroupModelCopyWith<$R, $In extends CategoryGroupModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, CategoryModel,
      CategoryModelCopyWith<$R, CategoryModel, CategoryModel>> get categories;
  $R call(
      {String? id,
      String? name,
      bool? hidden,
      List<CategoryModel>? categories});
  CategoryGroupModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CategoryGroupModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoryGroupModel, $Out>
    implements CategoryGroupModelCopyWith<$R, CategoryGroupModel, $Out> {
  _CategoryGroupModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CategoryGroupModel> $mapper =
      CategoryGroupModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, CategoryModel,
          CategoryModelCopyWith<$R, CategoryModel, CategoryModel>>
      get categories => ListCopyWith($value.categories,
          (v, t) => v.copyWith.$chain(t), (v) => call(categories: v));
  @override
  $R call(
          {String? id,
          String? name,
          bool? hidden,
          List<CategoryModel>? categories}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (hidden != null) #hidden: hidden,
        if (categories != null) #categories: categories
      }));
  @override
  CategoryGroupModel $make(CopyWithData data) => CategoryGroupModel(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      hidden: data.get(#hidden, or: $value.hidden),
      categories: data.get(#categories, or: $value.categories));

  @override
  CategoryGroupModelCopyWith<$R2, CategoryGroupModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CategoryGroupModelCopyWithImpl($value, $cast, t);
}
