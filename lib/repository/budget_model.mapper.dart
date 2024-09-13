// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'budget_model.dart';

class BudgetSummaryModelMapper extends ClassMapperBase<BudgetSummaryModel> {
  BudgetSummaryModelMapper._();

  static BudgetSummaryModelMapper? _instance;
  static BudgetSummaryModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BudgetSummaryModelMapper._());
      CurrencyFormatModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BudgetSummaryModel';

  static String _$id(BudgetSummaryModel v) => v.id;
  static const Field<BudgetSummaryModel, String> _f$id = Field('id', _$id);
  static String _$name(BudgetSummaryModel v) => v.name;
  static const Field<BudgetSummaryModel, String> _f$name =
      Field('name', _$name);
  static String _$dateFormat(BudgetSummaryModel v) => v.dateFormat;
  static const Field<BudgetSummaryModel, String> _f$dateFormat =
      Field('dateFormat', _$dateFormat, key: 'date_format');
  static String _$owner(BudgetSummaryModel v) => v.owner;
  static const Field<BudgetSummaryModel, String> _f$owner =
      Field('owner', _$owner);
  static CurrencyFormatModel _$currencyFormat(BudgetSummaryModel v) =>
      v.currencyFormat;
  static const Field<BudgetSummaryModel, CurrencyFormatModel>
      _f$currencyFormat =
      Field('currencyFormat', _$currencyFormat, key: 'currency_format');

  @override
  final MappableFields<BudgetSummaryModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #dateFormat: _f$dateFormat,
    #owner: _f$owner,
    #currencyFormat: _f$currencyFormat,
  };

  static BudgetSummaryModel _instantiate(DecodingData data) {
    return BudgetSummaryModel(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        dateFormat: data.dec(_f$dateFormat),
        owner: data.dec(_f$owner),
        currencyFormat: data.dec(_f$currencyFormat));
  }

  @override
  final Function instantiate = _instantiate;

  static BudgetSummaryModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BudgetSummaryModel>(map);
  }

  static BudgetSummaryModel fromJson(String json) {
    return ensureInitialized().decodeJson<BudgetSummaryModel>(json);
  }
}

mixin BudgetSummaryModelMappable {
  String toJson() {
    return BudgetSummaryModelMapper.ensureInitialized()
        .encodeJson<BudgetSummaryModel>(this as BudgetSummaryModel);
  }

  Map<String, dynamic> toMap() {
    return BudgetSummaryModelMapper.ensureInitialized()
        .encodeMap<BudgetSummaryModel>(this as BudgetSummaryModel);
  }

  BudgetSummaryModelCopyWith<BudgetSummaryModel, BudgetSummaryModel,
          BudgetSummaryModel>
      get copyWith => _BudgetSummaryModelCopyWithImpl(
          this as BudgetSummaryModel, $identity, $identity);
  @override
  String toString() {
    return BudgetSummaryModelMapper.ensureInitialized()
        .stringifyValue(this as BudgetSummaryModel);
  }

  @override
  bool operator ==(Object other) {
    return BudgetSummaryModelMapper.ensureInitialized()
        .equalsValue(this as BudgetSummaryModel, other);
  }

  @override
  int get hashCode {
    return BudgetSummaryModelMapper.ensureInitialized()
        .hashValue(this as BudgetSummaryModel);
  }
}

extension BudgetSummaryModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BudgetSummaryModel, $Out> {
  BudgetSummaryModelCopyWith<$R, BudgetSummaryModel, $Out>
      get $asBudgetSummaryModel =>
          $base.as((v, t, t2) => _BudgetSummaryModelCopyWithImpl(v, t, t2));
}

abstract class BudgetSummaryModelCopyWith<$R, $In extends BudgetSummaryModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  CurrencyFormatModelCopyWith<$R, CurrencyFormatModel, CurrencyFormatModel>
      get currencyFormat;
  $R call(
      {String? id,
      String? name,
      String? dateFormat,
      String? owner,
      CurrencyFormatModel? currencyFormat});
  BudgetSummaryModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _BudgetSummaryModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BudgetSummaryModel, $Out>
    implements BudgetSummaryModelCopyWith<$R, BudgetSummaryModel, $Out> {
  _BudgetSummaryModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BudgetSummaryModel> $mapper =
      BudgetSummaryModelMapper.ensureInitialized();
  @override
  CurrencyFormatModelCopyWith<$R, CurrencyFormatModel, CurrencyFormatModel>
      get currencyFormat =>
          $value.currencyFormat.copyWith.$chain((v) => call(currencyFormat: v));
  @override
  $R call(
          {String? id,
          String? name,
          String? dateFormat,
          String? owner,
          CurrencyFormatModel? currencyFormat}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (dateFormat != null) #dateFormat: dateFormat,
        if (owner != null) #owner: owner,
        if (currencyFormat != null) #currencyFormat: currencyFormat
      }));
  @override
  BudgetSummaryModel $make(CopyWithData data) => BudgetSummaryModel(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      dateFormat: data.get(#dateFormat, or: $value.dateFormat),
      owner: data.get(#owner, or: $value.owner),
      currencyFormat: data.get(#currencyFormat, or: $value.currencyFormat));

  @override
  BudgetSummaryModelCopyWith<$R2, BudgetSummaryModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BudgetSummaryModelCopyWithImpl($value, $cast, t);
}
