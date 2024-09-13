// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'currency_format_model.dart';

class CurrencyFormatModelMapper extends ClassMapperBase<CurrencyFormatModel> {
  CurrencyFormatModelMapper._();

  static CurrencyFormatModelMapper? _instance;
  static CurrencyFormatModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CurrencyFormatModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CurrencyFormatModel';

  static int _$decimalDigits(CurrencyFormatModel v) => v.decimalDigits;
  static const Field<CurrencyFormatModel, int> _f$decimalDigits =
      Field('decimalDigits', _$decimalDigits, key: 'decimal_digits');
  static int _$groupSize(CurrencyFormatModel v) => v.groupSize;
  static const Field<CurrencyFormatModel, int> _f$groupSize =
      Field('groupSize', _$groupSize, key: 'group_size');
  static String _$decimalSeparator(CurrencyFormatModel v) => v.decimalSeparator;
  static const Field<CurrencyFormatModel, String> _f$decimalSeparator =
      Field('decimalSeparator', _$decimalSeparator, key: 'decimal_separator');
  static String _$groupSeparator(CurrencyFormatModel v) => v.groupSeparator;
  static const Field<CurrencyFormatModel, String> _f$groupSeparator =
      Field('groupSeparator', _$groupSeparator, key: 'group_separator');
  static String _$symbol(CurrencyFormatModel v) => v.symbol;
  static const Field<CurrencyFormatModel, String> _f$symbol =
      Field('symbol', _$symbol);
  static bool _$displaySymbol(CurrencyFormatModel v) => v.displaySymbol;
  static const Field<CurrencyFormatModel, bool> _f$displaySymbol =
      Field('displaySymbol', _$displaySymbol, key: 'display_symbol');
  static bool _$symbolFirst(CurrencyFormatModel v) => v.symbolFirst;
  static const Field<CurrencyFormatModel, bool> _f$symbolFirst =
      Field('symbolFirst', _$symbolFirst, key: 'symbol_first');
  static String _$negativeSymbol(CurrencyFormatModel v) => v.negativeSymbol;
  static const Field<CurrencyFormatModel, String> _f$negativeSymbol = Field(
      'negativeSymbol', _$negativeSymbol,
      key: 'negative_symbol', opt: true, def: '-');
  static bool _$negativeSymbolFirst(CurrencyFormatModel v) =>
      v.negativeSymbolFirst;
  static const Field<CurrencyFormatModel, bool> _f$negativeSymbolFirst = Field(
      'negativeSymbolFirst', _$negativeSymbolFirst,
      key: 'negative_symbol_first', opt: true, def: true);

  @override
  final MappableFields<CurrencyFormatModel> fields = const {
    #decimalDigits: _f$decimalDigits,
    #groupSize: _f$groupSize,
    #decimalSeparator: _f$decimalSeparator,
    #groupSeparator: _f$groupSeparator,
    #symbol: _f$symbol,
    #displaySymbol: _f$displaySymbol,
    #symbolFirst: _f$symbolFirst,
    #negativeSymbol: _f$negativeSymbol,
    #negativeSymbolFirst: _f$negativeSymbolFirst,
  };

  static CurrencyFormatModel _instantiate(DecodingData data) {
    return CurrencyFormatModel(
        decimalDigits: data.dec(_f$decimalDigits),
        groupSize: data.dec(_f$groupSize),
        decimalSeparator: data.dec(_f$decimalSeparator),
        groupSeparator: data.dec(_f$groupSeparator),
        symbol: data.dec(_f$symbol),
        displaySymbol: data.dec(_f$displaySymbol),
        symbolFirst: data.dec(_f$symbolFirst),
        negativeSymbol: data.dec(_f$negativeSymbol),
        negativeSymbolFirst: data.dec(_f$negativeSymbolFirst));
  }

  @override
  final Function instantiate = _instantiate;

  static CurrencyFormatModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CurrencyFormatModel>(map);
  }

  static CurrencyFormatModel fromJson(String json) {
    return ensureInitialized().decodeJson<CurrencyFormatModel>(json);
  }
}

mixin CurrencyFormatModelMappable {
  String toJson() {
    return CurrencyFormatModelMapper.ensureInitialized()
        .encodeJson<CurrencyFormatModel>(this as CurrencyFormatModel);
  }

  Map<String, dynamic> toMap() {
    return CurrencyFormatModelMapper.ensureInitialized()
        .encodeMap<CurrencyFormatModel>(this as CurrencyFormatModel);
  }

  CurrencyFormatModelCopyWith<CurrencyFormatModel, CurrencyFormatModel,
          CurrencyFormatModel>
      get copyWith => _CurrencyFormatModelCopyWithImpl(
          this as CurrencyFormatModel, $identity, $identity);
  @override
  String toString() {
    return CurrencyFormatModelMapper.ensureInitialized()
        .stringifyValue(this as CurrencyFormatModel);
  }

  @override
  bool operator ==(Object other) {
    return CurrencyFormatModelMapper.ensureInitialized()
        .equalsValue(this as CurrencyFormatModel, other);
  }

  @override
  int get hashCode {
    return CurrencyFormatModelMapper.ensureInitialized()
        .hashValue(this as CurrencyFormatModel);
  }
}

extension CurrencyFormatModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CurrencyFormatModel, $Out> {
  CurrencyFormatModelCopyWith<$R, CurrencyFormatModel, $Out>
      get $asCurrencyFormatModel =>
          $base.as((v, t, t2) => _CurrencyFormatModelCopyWithImpl(v, t, t2));
}

abstract class CurrencyFormatModelCopyWith<$R, $In extends CurrencyFormatModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? decimalDigits,
      int? groupSize,
      String? decimalSeparator,
      String? groupSeparator,
      String? symbol,
      bool? displaySymbol,
      bool? symbolFirst,
      String? negativeSymbol,
      bool? negativeSymbolFirst});
  CurrencyFormatModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CurrencyFormatModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CurrencyFormatModel, $Out>
    implements CurrencyFormatModelCopyWith<$R, CurrencyFormatModel, $Out> {
  _CurrencyFormatModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CurrencyFormatModel> $mapper =
      CurrencyFormatModelMapper.ensureInitialized();
  @override
  $R call(
          {int? decimalDigits,
          int? groupSize,
          String? decimalSeparator,
          String? groupSeparator,
          String? symbol,
          bool? displaySymbol,
          bool? symbolFirst,
          String? negativeSymbol,
          bool? negativeSymbolFirst}) =>
      $apply(FieldCopyWithData({
        if (decimalDigits != null) #decimalDigits: decimalDigits,
        if (groupSize != null) #groupSize: groupSize,
        if (decimalSeparator != null) #decimalSeparator: decimalSeparator,
        if (groupSeparator != null) #groupSeparator: groupSeparator,
        if (symbol != null) #symbol: symbol,
        if (displaySymbol != null) #displaySymbol: displaySymbol,
        if (symbolFirst != null) #symbolFirst: symbolFirst,
        if (negativeSymbol != null) #negativeSymbol: negativeSymbol,
        if (negativeSymbolFirst != null)
          #negativeSymbolFirst: negativeSymbolFirst
      }));
  @override
  CurrencyFormatModel $make(CopyWithData data) => CurrencyFormatModel(
      decimalDigits: data.get(#decimalDigits, or: $value.decimalDigits),
      groupSize: data.get(#groupSize, or: $value.groupSize),
      decimalSeparator:
          data.get(#decimalSeparator, or: $value.decimalSeparator),
      groupSeparator: data.get(#groupSeparator, or: $value.groupSeparator),
      symbol: data.get(#symbol, or: $value.symbol),
      displaySymbol: data.get(#displaySymbol, or: $value.displaySymbol),
      symbolFirst: data.get(#symbolFirst, or: $value.symbolFirst),
      negativeSymbol: data.get(#negativeSymbol, or: $value.negativeSymbol),
      negativeSymbolFirst:
          data.get(#negativeSymbolFirst, or: $value.negativeSymbolFirst));

  @override
  CurrencyFormatModelCopyWith<$R2, CurrencyFormatModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CurrencyFormatModelCopyWithImpl($value, $cast, t);
}
